on run {input, parameters}
  tell application "Finder"
    try
      set currentFolder to (folder of window 1) as alias
      set workspaceFiles to (every file of currentFolder whose name extension is "Rproj")
      if (count of workspaceFiles) = 0 then 
        display dialog "No Rproj files found in directory."
      else if (count of workspaceFiles) = 1 then 
        set workspaceFile to item 1 of workspaceFiles
        set workspacePath to POSIX path of (workspaceFile as alias)
        do shell script "open -n -a RStudio " & quoted form of workspacePath
      else if (count of workspaceFiles) > 1 then 
        display dialog "Multiple Rproj files found in directory."
      end if
      on error
          display dialog "No Finder window is open."
      end try
  end tell
end run
