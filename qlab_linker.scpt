(*
  This script updates the script cues in the Master Happenings Control File and links stop cues to start cues.
  
  To use this script, follow these steps:
  
  1. Edit the variable "MASTER_UID" below to set it to the unique ID of the master QLab project.
  2. Set the "HAPPENINGS_DIRECTORY" variable below to the path of the folder containing the QLab project files.
  3. Select the cues in the QLab workspace that you want to update and link.
  4. Run the script.
  
If any of the selected cues are colored green, the script will try to find the most recently updated QLab project file that has the cue's name and update the script cue with the path to the new file. If multiple files are found with similar names, the script will pick the most recently updated one.

For red stop cues that have a matching start cue, the script will link the stop cue to the start cue.

If the script can't find any of the files it needs, it will display a dialog box with the names of the missing files. If the master QLab project is not detected, the user will receive a notification. If any errors occur during the process, an error dialog will be displayed.
*)

set MASTER_UID to "E72F4B0B-04EE-484A-B5E8-5D703411A962"
set HAPPENINGS_DIRECTORY to "/Users/admin/Desktop/RES - HAPPENINGS QLAB"


-- Define a function to replace characters in a string
on replace_chars(this_text, search_string, replacement_string)
	set AppleScript's text item delimiters to the search_string
	set the item_list to every text item of this_text
	set AppleScript's text item delimiters to the replacement_string
	set this_text to the item_list as string
	set AppleScript's text item delimiters to ""
	return this_text
end replace_chars

-- Start the QLab application and get the front workspace
tell application id "com.figure53.QLab.4"
	try
		set frontWorkspace to first workspace
		
		-- Check if the front workspace is the master QLab project
		if unique id of frontWorkspace is not MASTER_UID then
			display dialog "Master File not detected! Is the UID set correctly in this script?"
			return
		else
			-- Get the list of selected cues
			set selectedCues to selected of frontWorkspace as list
			
			-- Check if any cues are selected
			if selectedCues is {} then
				display dialog "No cues selected!"
				return
			else
				-- Initialize variable to store missing file names
				set missingFiles to ""
				-- Loop through the selected cues and update the script cues
				repeat with sourceCue in selectedCues
					set cueColor to q color of sourceCue
					if cueColor = "green" then
						set cueName to q name of sourceCue
						
						-- Get the most recently modified matching file path
						set escapedHAPPENINGS_DIRECTORY to my replace_chars(HAPPENINGS_DIRECTORY, " ", "\\ ")
						-- Find all matching files
						set foundFiles to paragraphs of (do shell script "find " & escapedHAPPENINGS_DIRECTORY & " -type f -iname '*" & cueName & "*.qlab4' -print0 | xargs -0 ls -tp")
						
						-- Prompt the user to select a file if there are multiple matches
						if (count of foundFiles) > 1 then
							set chosenFile to (choose from list foundFiles with title "Select a QLab project file for cue " & cueName & ":" with prompt "Multiple matching files found. Please select one:") as string
							if chosenFile is not equal to false then
								set newFilePath to chosenFile
							else
								set missingFiles to missingFiles & cueName & return
							end if
						else if (count of foundFiles) = 1 then
							set newFilePath to item 1 of foundFiles
						else
							set missingFiles to missingFiles & cueName & return
						end if
						
						-- If a matching file is found, update the script cue content
						if newFilePath is not "" then
							-- Convert the POSIX path to a HFS path
							set newHFSPath to (POSIX file newFilePath) as alias
							
							-- Update the script cue content
							set scriptText to "tell application id \"com.figure53.QLab.4\"" & return & ¬
								"  open \"" & newHFSPath & "\"" & return & ¬
								"end tell"
							set script source of sourceCue to scriptText
							log "Set start cue " & cueName & " to directory " & newHFSPath
						end if
					end if
				end repeat
				
				-- Loop through the selected cues and link stop cues to start cues
				repeat with stopCue in selectedCues
					set stopColor to q color of stopCue
					if stopColor = "red" and (count of selectedCues) ≥ 2 then
						set stopCueName to q name of stopCue
						repeat with openCue in selectedCues
							set openCueColor to q color of openCue
							set openCueName to q name of openCue
							-- If a matching start cue is found, link the stop cue to it
							if openCueColor = "green" and stopCueName contains openCueName then
								tell frontWorkspace
									--open the workspace and exit the loop
									start openCue
									delay 7
									exit repeat
								end tell
							end if
						end repeat
					else if (count of selectedCues) < 2 then
						display dialog "Must select at least two cues (both stop and start cues) to link stop cues"
						exit repeat
					end if
					
					-- Grab the workspace ID of the current stop cue's start counterpart.
					set currentWorkspaceID to unique id of front workspace
					if unique id of frontWorkspace is not unique id of front workspace then
						close front workspace without saving
						--update the script of the stop cue with the correct UID
						set scriptText to "tell application id \"com.figure53.QLab.4\"" & return & ¬
							"  set workspaceID to first workspace whose unique id is \"" & currentWorkspaceID & "\"" & return & ¬
							"  close workspaceID without saving" & return & ¬
							"end tell"
						set script source of stopCue to scriptText
						log "Set stop cue " & stopCueName & " to UID " & currentWorkspaceID
					end if
				end repeat
			end if
			
			-- If any files could not be found, display a dialog with the missing file names
			if missingFiles is not "" then
				display dialog "The following files could not be found:" & return & return & missingFiles
				log "The following files could not be found:" & return & missingFiles
			end if
		end if
		
	on error errMsg
		-- If an error occurs, display an error dialog
		display dialog errMsg
		log errMsg
	end try
end tell
