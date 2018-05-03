^+c::

clipsaved:= ClipboardAll

psScript =
(
Set-ExecutionPolicy Unrestricted
Import-Module Posh-Vault

try { $creds = Get-VaultCredential -Resource SuperSecretPassword -User $env:userName }
catch { $credentials = Get-Credential -User $env:userName -Message 'Enter the password you want to store in Windows Vault'; Set-Vault-Credential -Resource SuperSecretPassword -Credential $credentials }
$creds.GetNetworkCredential().Password | set-Clipboard
)

RunWait PowerShell.exe -ExeutionPolicy Unrestricted -Command &}%psScript%}.. hide
; SendRaw %clipboard%
; Send ^v
; Clipboard := clipsaved
Return
