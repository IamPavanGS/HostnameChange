param([switch]$Elevated)

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    if ($elevated) {
        # tried to elevate, did not work, aborting
    } else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    }
    exit
}


$Serial = (gwmi win32_bios).serialnumber

Rename-Computer -NewName "L$Serial"

Rename-Item -Path "C:\Windows\System32\Recovery\ReAgent.xml" -NewName "C:\Windows\System32\Recovery\ReAgent_old.xml" 

$ButtonType = 0
$Confirmation = New-Object -ComObject wscript.shell
$ConfirmationAnswer = $Confirmation.popup("System Hostname has been changed, kindly restart the system to take effect",$ButtonType)
If ($ConfirmationAnswer -eq 6) { 
    $Confirmation.popup("You clicked yes.") 
} else { 
    
    Remove-Item -Path $MyInvocation.MyCommand.Source

} 






