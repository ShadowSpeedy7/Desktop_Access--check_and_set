$User = "$($env:computername)\test"
$Path = "C:\users\test\desktop"

$Perms = Get-Acl $Path
$flag = 0
ForEach ($Perm in $Perms.Access) {
    if ($Perm.IdentityReference -eq $User -and $Perm.AccessControlType -eq "Deny" -and $Perm.FileSystemRights -eq "Write") {
        $flag = 1
    }
}
Write-Host $flag
