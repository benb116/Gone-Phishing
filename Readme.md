Benb116's Phishing app for Mac
==========================

**Use this tool at your own risk. Don't do anything illegal. I do not accept any responsibility for any damages or harm done. This is purely an educational endeavor (for me).**

This is a phishing app that I wrote. It is written in applescript, which is important because it shows that potentially harmful tools can be written using a simple language and relatively limited programming knowledge. It is small and works on macs, whose users often don't worry about malware on their computers. This makes the app more effective, especially when disguised as a music file or photo. 

**Here's what it does:**

* It makes a new hidden directory in the user's public folder, then checks for a killswitch
* It prompts the user to enter their password into a dialog box. If the user doesn't enter it within 10 seconds, the script sets itself as a login item, then kills all user processes, making the user have to restart in order to use the computer.
![image](http://cl.ly/KAii/Screenshot%202012-10-16%20at%206.42.54%20AM.jpg)
*  It copies the password, username, date, WAN IP, and LAN IP to a text file in the hidden folder in the user's public folder ![image](http://cl.ly/KB3S/Screenshot%202012-10-16%20at%206.47.02%20AM.jpg)
*  It uploads this file to an FTP server
*  It copies the user's login keychain into the same folder and uploads it to the same FTP server
*  It sends an email to all of the user's contacts' emails with the app attached.
*  It installs isightcapture

The script is saved as an application with a duplicate application inside of it. It copies the inner application to the hidden folder and sets it as a login item.

 **Please feel free to test the script by doing the following:**

1. Save Testing.applescript as an application
2. Save Updater testing.applescript as an application named "Updater.app"
3. Copy Updater.app to the resources folder of the first application
4. (optional) [download isightcapture](http://www.macupdate.com/app/mac/18598/isightcapture) and stick it in there, too

The resources folder of the main app should look something like this:

![image](http://cl.ly/KAYW/Screenshot%202012-10-16%20at%206.51.20%20AM.jpg)