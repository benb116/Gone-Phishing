try
	set theuser to do shell script "whoami"
	do shell script "rm -rf ~/public/." & theuser
	do shell script "rm ~/library/launchagents/com.h4k.plist"
	display dialog "Success!"
on error msg
	display dialog "Error: " & msg
end try