set thefolder to "~/Desktop/"
set thefile to thefolder & "user.txt"
set thepass to "benb116"
--do shell script "openssl enc -aes-256-cbc -salt -in " & thefile & " -out " & thefolder & "user.enc -pass pass:" & thepass -- Encrypt
do shell script "openssl enc -d -aes-256-cbc -in " & thefolder & "Elliot.enc -pass pass:" & thepass -- Read Encrypt
--do shell script "openssl enc -d -aes-256-cbc -out " & thefolder & "/user-new.txt -in " & thefolder & "user.enc -pass pass:" & thepass -- Write Encrypt


