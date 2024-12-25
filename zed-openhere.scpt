on run {input, parameters}
  tell application "Finder"
    set myWin to window 1
    set thePath to (quoted form of POSIX path of (target of myWin as alias))
    do shell script "/usr/local/bin/zed -n " & thePath
  end tell
end run
