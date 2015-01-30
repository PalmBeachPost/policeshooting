# Police Shooting Database
Script to verify and  normalize police shooting data

### Step by Step guide
---
- Clone repo
- Place data under ./data/original as xlsx
- rename files to rawincidents, rawsubjects and rawofficers
- open setup.ps1 under setup folder in your favorite text editor.
- replace ENTERPASSWORDHERE with your database password.
- Update databse name if required
- open PowerShell and navigate to setup folder
	example : ``` cd c:\git\policeshootings\setup ```
- To update scripts run 
	```
	 ./setup.ps1 -server <databaseservername> -user <username> -password <password>
	```
- To update data or to set up new database from scratch
	```
	./setup.ps1 -nuke 1 -server <databaseservername> -user <username> -password <password>
	```
	
### Assumptions
---
- Windows machine
- A few parameters are currently hardcoded

### Requirements
---
 - [Powershell] (http://social.technet.microsoft.com/wiki/contents/articles/21016.how-to-install-windows-powershell-4-0.aspx)
 - [MySQL ODBC connector] (http://dev.mysql.com/downloads/connector/odbc/)
