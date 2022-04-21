Config {
       font = "xft:Iosevka:size=12:bold:antialias=true,Source Han Sans HC,Noto Color Emoji" --latin/asian fonts and emojis
       , additionalFonts = [ "xft:Font Awesome 6 Free Solid:size=11" ]
       , allDesktops = True
       , bgColor = "#181818"
       , fgColor = "#eeeeee"
       , position = TopW L 100
       , iconRoot     = ".xmonad/xpm/"  -- default: "."⎋
       , commands = [ Run Cpu [ "--template", "<fc=#a9a1e1><fn=1></fn></fc> <total>%"
                              , "--Low","20"
                              , "--High","70"
                              , "--low","#eeeeee"
                              , "--normal","#eeeeee"
                              , "--high","#fb4934"] 50

                    , Run Memory ["-t","<fc=#51afef><fn=1></fn></fc> <used>M (<usedratio>%)"
                                 ,"-H","80000"
                                 ,"-L","10"
                                 ,"-l","#eeeeee"
                                 ,"-n","#eeeeee"
                                 ,"-h","#fb4934"] 50
                    , Run Swap [] 10
                    , Run Date "<fc=#ECBE7B><fn=1></fn></fc> %a, %d %b %H:%M" "date" 300
                    , Run DynNetwork ["-t","<fc=#4db5bd><fn=1></fn></fc> <rx>, <fc=#c678dd><fn=1></fn></fc> <tx>"
                                     ,"-H","200"
                                     ,"-L","10"
                                     ,"-h","#eeeeee"
                                     ,"-l","#eeeeee"
                                     ,"-n","#eeeeee"] 50

                    , Run CoreTemp ["-t", "<fc=#CDB464><fn=1></fn></fc> <core0>°C"
                                   , "-L", "30"
                                   , "-H", "75"
                                   , "-l", "lightblue"
                                   , "-n", "#eeeeee"
                                   , "-h", "#aa4450"] 50

                    -- battery monitor
                    , Run BatteryP       [ "BAT0" ]
                                         [ "--template" , "<fc=#B1DE76><fn=1></fn></fc> <acstatus>"
                                         , "--Low"      , "10"        -- units: %
                                         , "--High"     , "80"        -- units: %
                                         , "--low"      , "#fb4934" -- #ff5555
                                         , "--normal"   , "#bbc2cf"
                                         , "--high"     , "#98be65"

                                         , "--" -- battery specific options
                                                   -- discharging status
                                                   , "-o"   , "<left>% (<timeleft>)"
                                                   -- AC "on" status
                                                   , "-O"   , "<left>% (<fc=#98be65>Charging</fc>)" -- 50fa7b
                                                   -- charged status
                                                   , "-i"   , "<fc=#98be65>Charged</fc>"
                                         ] 50
		    , Run Volume "default" "Master" ["-t", "<fn=1></fn> <volume>%"] 5
            -- keyboard layout indicator
            , Run Kbd            [ ("fi"                , "<fc=#eeeeee,#181818> <fn=1></fn> FI </fc>")
                                 , ("us"                , "<fc=#eeeeee,#181818> <fn=1></fn> US </fc>")
                                 ]
                    , Run UnsafeStdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " <icon=haskell_25.xpm/> %UnsafeStdinReader% }{%kbd%| %default:Master% | %cpu% | %coretemp% | %memory% | %date% |           "   -- #69DFFA
       }
