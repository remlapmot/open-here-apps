on run {input, parameters}
  tell application "Finder"
    try
      set currentFolder to (folder of window 1) as alias
      set workspaceFiles to (every file of currentFolder whose name extension is "Rproj")
      if (count of workspaceFiles) = 0 then
        set textExtensions to {"R", "r", "Rmd", "rmd", "qmd", "md", "txt", "csv", "py", "sql", "json", "yaml", "yml", "toml"}
        set textFiles to {}
        repeat with ext in textExtensions
          set matches to (every file of currentFolder whose name extension is ext)
          set textFiles to textFiles & matches
        end repeat
        if (count of textFiles) > 0 then
          set textFile to item 1 of textFiles
          set textFilePath to POSIX path of (textFile as alias)
          do shell script "open -n -a RStudio " & quoted form of textFilePath
        else
          display dialog "No Rproj or text files found in directory."
        end if
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
