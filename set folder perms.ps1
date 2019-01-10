$Path = "C:\users\test\desktop"
$User = "test"

if (!$Args[0]) {
Write-Host "No command specified, use 'ACL.ps1 lock' or 'ACL.ps1 unlock'"
exit
}

if ($Args[0] -ne "unlock" -and $Args[0] -ne "lock") {
    Write-Host "Unknown command argument - use 'lock' or 'unlock'"
    exit
}

$ACL = Get-Acl $Path 
$Perm = New-Object system.security.accesscontrol.filesystemaccessrule("$($env:computername)\$($User)","Write","Deny")

if ($Args[0] -eq "lock") {
    $ACL.SetAccessRule($Perm)
}
else {
    $ACL.RemoveAccessRule($Perm) > $null
}
Set-Acl $Path $ACL