tell application "Finder"
    set winList to every window
    if (count of winList) > 3 then
        repeat with i from 4 to (count of winList)
            close item i of winList
        end repeat
    end if
end tell
