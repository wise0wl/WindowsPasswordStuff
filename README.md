### tl;dr
This is how I copy / paste my password at home "securely" over and over.  I use two-factor auth on most devices and hate having to type a 20+ character password / passphrase every time before I hit my MFA token.  It saves time.  I know it's slightly less secure than typing it out every time (is it though?) but I type it once per login and that's enough for me.

### Prerequisites and requirements
1. PowerShell module POSH
```powershell
Install-Module Posh-Vault
```
2. Install [AutoHotkey](https://autohotkey.com)
3. Run the following PowerShell script to add your password to the vault
```powershell
$creds = get-credential -Message 'Enter username and password to store in Windows vault' -UserName $env:userName
if ($creds -eq $null)
{
$wshell = New-Object -ComObject Wscript.Shell
$wshell.Popup("Ugh...you have to enter a username and password. Try again")
exit
} else {
set-VaultCredential -Resource SuperSecretPassword -User $creds.GetNetworkCredential().Username -Password $creds.GetNetworkCredential().Password
}
```
4. Add the [password.ahk](https://raw.githubusercontent.com/wise0wl/Windows10PasswordStuff/master/password.ask) file to your desktop or whatever and **click** it when you first login after rebooting
5. CRTL-SHFT-C to copy password into paste buffer, CRTL-V (like usual) to paste it
6. Profit! 
