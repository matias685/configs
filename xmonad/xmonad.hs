------------------------------------------------------------------------
-- import
------------------------------------------------------------------------

-- base
import XMonad hiding ( (|||) ) -- jump to layout
import System.Exit
import XMonad.Operations
import XMonad.Config.Desktop
import qualified XMonad.StackSet as W
import System.IO (hPutStrLn) -- for xmobar

-- data
import Data.Char (isSpace)
import Data.List
import Data.Monoid
import Data.Maybe (isJust)
import Data.Ratio ((%)) -- for video
import qualified Data.Map as M

-- util
import XMonad.Util.Run (safeSpawn, unsafeSpawn, runInTerm, spawnPipe)
import XMonad.Util.EZConfig (additionalKeysP, additionalMouseBindings)  
import XMonad.Util.NamedScratchpad
import XMonad.Util.NamedWindows

-- hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks (avoidStruts, docksStartupHook, manageDocks, ToggleStruts(..))
import XMonad.Hooks.EwmhDesktops -- to show workspaces in application switchers
import XMonad.Hooks.ManageHelpers (isFullscreen, isDialog,  doFullFloat, doCenterFloat, doRectFloat) 
import XMonad.Hooks.Place (placeHook, withGaps, smart)
import XMonad.Hooks.InsertPosition

-- actions
import XMonad.Actions.UpdatePointer -- update mouse postion
import XMonad.Actions.CycleWS -- cycle between workspaces

-- layout
import XMonad.Layout.LayoutCombinators (JumpToLayout(..), (|||)) 
import XMonad.Layout.Renamed (renamed, Rename(Replace))
import XMonad.Layout.LimitWindows (limitWindows, increaseLimit, decreaseLimit)
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.SimplestFloat
import XMonad.Layout.Simplest
import XMonad.Layout.Gaps
import XMonad.Layout.GridVariants
import XMonad.Layout.ResizableTile
import XMonad.Layout.ThreeColumns

------------------------------------------------------------------------
-- variables
------------------------------------------------------------------------

myModMask = mod4Mask -- Sets modkey to super/windows key
myTerminal = "urxvt" -- Sets default terminal
myBorderWidth = 2 -- Sets border width for windows
myNormalBorderColor = "#3b444b"
myFocusedBorderColor = "#9400d3"
myppCurrent = "#268bd2"
myppVisible = "#268bd2"
myppHidden = "#268bd2"
myppHiddenNoWindows = "#93A1A1"
myppTitle = "#eeeeee"
myppUrgent = "#DC322F"
myWorkspaces = ["1","2","3","4","5","6","7","8","9"]
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

-- center window

centerWindow :: Window -> X ()
centerWindow win = do
    (_, W.RationalRect x y w h) <- floatLocation win
    windows $ W.float win (W.RationalRect ((1 - w) / 2) ((1 - h) / 2) w h)
    return ()
    
------------------------------------------------------------------------
-- layout
------------------------------------------------------------------------

myLayout = (tiled ||| mirror |||  full ||| grid ||| threecol ||| float)
  where
     -- full
     full = renamed [Replace "Full"] 
          $ noBorders (Full)

     -- tiled
     tiled = renamed [Replace "Tall"]
           -- $ smartBorders
           $ avoidStruts
           $ spacingRaw False (Border 5 5 5 5) True (Border 5 5 5 5) True 
           $ ResizableTall 1 (3/100) (1/2) []

     -- mirror
     mirror = renamed [Replace "Mirror"]
          $ avoidStruts
          $ Mirror
          $ spacingRaw False (Border 5 5 5 5) True (Border 5 5 5 5) True 
          $ Tall 1 (3/100) (3/5)

     -- grid
     grid = renamed [Replace "Grid"]
          $ avoidStruts
          $ spacingRaw False (Border 5 5 5 5) True (Border 5 5 5 5) True 
          $ Grid (16/10)

     -- threecol
     threecol = renamed [Replace "Column"]
          $ avoidStruts
          $ spacingRaw False (Border 5 5 5 5) True (Border 5 5 5 5) True
          $ ThreeColMid 1 (3/100) (1/2)

     -- floats
     float = renamed [Replace "Float"]
          $ limitWindows 20 simplestFloat

     -- The default number of windows in the master pane
     nmaster = 1
     
     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100

------------------------------------------------------------------------
-- Window rules:
------------------------------------------------------------------------

myManageHook = composeAll
    [ className =? "firefox" <&&> resource =? "Toolkit" --> doCenterFloat -- firefox pip
    , className =? "firefox" <&&> resource =? "Browser" --> doFloat -- firefox about window
    , className =? "firefox" <&&> resource =? "Places" --> doCenterFloat -- firefox downloads window
    , className =? "Chromium" <&&> resource =? "Picture in picture" --> doFloat
    , className =? "Galculator" --> doCenterFloat
    , className =? "Pcsx2" --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , isDialog --> doCenterFloat
    -- , isFullscreen --> doFullFloat
    ] 
    
------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
------------------------------------------------------------------------

myKeys =
    -- Restart/recompile xmonad
    [  ("M-S-r", spawn "xmonad --restart")
     , ("M-C-r", spawn "xmonad --recompile")

     -- Volume control
     , ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5%+")
     , ("<XF86AudioLowerVolume>", spawn "amixer set Master 5%-") 
     , ("<XF86AudioMute>", spawn "amixer set Master toggle")

     -- Window Manager commands
     , ("M-c", kill)
     , ("M-a", sendMessage MirrorExpand)
     , ("M-z", sendMessage MirrorShrink)
     , ("M-b", sendMessage ToggleStruts)
     , ("M-f", sendMessage $ JumpToLayout "Full")
     , ("M-t", sendMessage $ JumpToLayout "Tall")
     , ("M-g", sendMessage $ JumpToLayout "Grid")
     , ("M-u", sendMessage $ JumpToLayout "Column")
     , ("M-m", sendMessage $ JumpToLayout "Mirror")
     , ("M-S-c", withFocused $ centerWindow)
     , ("S-M-t", withFocused $ windows . W.sink) -- flatten floating window to tiled
     , ("M-S-<Return>", windows W.shiftMaster) -- move window to master
     
     -- Program shortcuts
     , ("M-<Return>", spawn myTerminal)
     , ("M-d", spawn "dmenu_run -h 28 -p 'run: '") -- dmenu
     , ("M-x", spawn "clipmenu")
     , ("M-p", spawn "rofi -show drun") -- rofi
     , ("M-e", spawn "rofi -show emoji")
     , ("M-w", spawn "firefox")
     , ("M-S-e", spawn "emacsclient -c -n")
     , ("M-i", spawn (myTerminal ++ " -e btop"))
     , ("M-r", spawn "st -e lfub")
     , ("M-q", spawn "pmenu")
     , ("M-s", spawn "sh ~/scripts/screenshot.sh")
     , ("M-S-k", spawn (myTerminal ++ " -e calcurse"))

     -- Move between workspaces
     , ("M-n", nextWS)
     , ("M-S-n", prevWS)
    ]
    

------------------------------------------------------------------------
-- main
------------------------------------------------------------------------

main = do
    xmproc0 <- spawnPipe "xmobar ~/.xmonad/xmobar.hs"
    xmonad $ ewmh desktopConfig
        { manageHook = ( isFullscreen --> doFullFloat ) <+> manageDocks <+>  insertPosition Master Newer <+> myManageHook <+> manageHook desktopConfig
        , layoutHook         = myLayout
        , handleEventHook    = handleEventHook desktopConfig
        , workspaces         = myWorkspaces
        , borderWidth        = myBorderWidth
        , terminal           = myTerminal
        , modMask            = myModMask
        , normalBorderColor  = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        , logHook = dynamicLogWithPP xmobarPP  
                        { ppOutput = hPutStrLn xmproc0 
                        , ppCurrent = xmobarColor myppCurrent "" . wrap "[" "]" -- Current workspace in xmobar
                        , ppVisible = xmobarColor myppVisible ""                -- Visible but not current workspace
                        , ppHidden = xmobarColor myppHidden "" . wrap "" ""   -- Hidden workspaces in xmobar
                        , ppHiddenNoWindows = xmobarColor  myppHiddenNoWindows ""        -- Hidden workspaces (no windows)
                        , ppTitle = xmobarColor  myppTitle "" . shorten 120     -- Title of active window in xmobar
                        , ppSep =  "<fc=#586E75> | </fc>"                     -- Separators in xmobar
                        , ppUrgent = xmobarColor  myppUrgent "" . wrap "!" "!"  -- Urgent workspace
                        , ppExtras  = [windowCount]                           -- # of windows current workspace
                        , ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]
                        } >> updatePointer (0.25, 0.25) (0.25, 0.25)
          }
          `additionalKeysP` myKeys
