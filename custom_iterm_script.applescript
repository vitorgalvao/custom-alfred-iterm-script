-- Change this property to true to always use a new window
property open_in_new_window : false

on alfred_script(q)
	tell application "iTerm"
		if application "iTerm" is running then
			if open_in_new_window is true then
				create window with default profile
			else
				try
					tell the first window to create tab with default profile
				on error
					create window with default profile
				end try
			end if
		end if

		delay 0.1 -- If we do not wait, the command may fail to send

		tell the first window to tell current session to write text q
		activate
	end tell
end alfred_script
