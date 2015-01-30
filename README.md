# Police Shooting database setup
Script to verify and  normalize police shooting data

### Step by Step guide
---
- Clone repo
- Place data under ./data/original as xlsx
- rename files to rawincidents, rawsubjects and rawofficers
- open setup.ps1 under setup folder in your favorite text editor.
- replace ENTERPASSWORDHERE with your databse password.
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