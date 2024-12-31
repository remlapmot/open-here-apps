on run {input, parameters}
  tell application "Finder"
    try
      set currentFolder to (folder of window 1) as alias
      set workspaceFiles to (every file of currentFolder whose name extension is "code-workspace")
      if (count of workspaceFiles) = 0 then 
        set folderPath to POSIX path of currentFolder
        do shell script "/usr/local/bin/positron -n " & quoted form of folderPath
      else if (count of workspaceFiles) = 1 then 
        set workspaceFile to item 1 of workspaceFiles
        set workspacePath to POSIX path of (workspaceFile as alias)
        do shell script "/usr/local/bin/positron -n " & quoted form of workspacePath
      else if (count of workspaceFiles) > 1 then 
        display dialog "Multiple code-workspace files found in directory."  
      end if
      on error
        display dialog "No Finder window is open."
      end try
  end tell
end run
