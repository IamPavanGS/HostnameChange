# HostnameChange
# Auto Change the Hostname after Deployment

# After the OS is deployed to a end machine if the requirement is to change the hostname as per the organization standards or to get a unique Hostname follow the below procedure. This procedure should be used for offline image creation without using any third party tools, I will explain how to image ISO using third party tools like WDS, MDT and Desktop central in the later tutorials.

### For this purpose we will create 2 scripts one is using batch and one is using PowerShell so after the system is deployed with image this script will run automatically to make the necessary changes.

First we will create a PowerShell script which will change the hostname of the machine, in this scenario we will make the hostname change in the particular pattern i.e., “L” prefixed by the system serial number. You can refer to the below code.

After saving the above code as Hostname.ps1 save the file in “C:\Users\Public\Documents”

Now lets create a trigger script which will trigger this script, for that we will create a batch file which will trigger the PowerShell script, for that we will use the below batch file

After Copying the batch file save this as Hostnname.bat and save it under “C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Start-up”

## Mechanism and working of the scripts

When a batch file and PowerShell file is placed in the given location, after the system starts the batch file in the start up folder will be triggered by windows this batch file triggers the PowerShell script and the PowerShell script will run as admin by default which is coded. So the PowerShell script will change the system hostname as per the encoded method. So these 2 scripts are designed to delete itself after the purpose is served this prevents the scripts to run every time the system starts up.
