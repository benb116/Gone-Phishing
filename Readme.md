Benb116's Phishing app for Mac
==========================

This is an phishing app that I wrote. It is written in applescript, which is important because it shows that  potentially harmful tools can be written using a simple language and relatively limited programming knowledge. It is small and works on macs, whose users often don't worry about malware on their computers. This makes the app more effective, especially when disguised as a music file or photo. 

**Here's what it does:**

* It makes a new hidden directory in the user's public folder, then checks for a killswitch
* It prompts the user to enter their password into a dialog box. If they don't enter it within 20 seconds, the script kills all user processes, making the user have to restart in order to use the computer.
![image](http://cl.ly/KAii/Screenshot%202012-10-16%20at%206.42.54%20AM.jpg)
*  It sets itself as a login item, so the user must enter the password in order to get rid of the threat.
*  It copies the password, username, date, WAN IP, and LAN IP to a text file in the hidden folder in the user's public folder ![image](http://cl.ly/KB3S/Screenshot%202012-10-16%20at%206.47.02%20AM.jpg)
*  It uploads this file to an FTP server
*  It copies the user's login keychain into the same folder and uploads it to the FTP server
*  It stores all of the user's contacts' emails in a text file, then sends an email to all of them with the app attached.
*  It enables SSH and VNC on the computer
*  It installs isightcapture (these two parts are not necessary and are only if the phisher wants to be really mean)

The script is saved as an application with another application inside of it. It copies the inner application and sets it as a login item.

The script has had limited but successful testing. **Please feel free to test it by doing the following:**

1. Save Testing.applescript as an application
2. Save Updater testing.applescript as an application named "Updater.app"
3. Copy Updater.app to the resources folder of the first application
4. (optional) download isightcapture and stick it in there, too

The resources folder should look something like this:

![image](http://cl.ly/KAYW/Screenshot%202012-10-16%20at%206.51.20%20AM.jpg)

**Use this tool at your own risk. Don't do anything illegal. I do not accept any responsibility for any damages or harm done. This is purely an educational endeavor (for me).**