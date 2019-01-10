# Desktop_Access--check_and_set
-- "check for folder perms.ps1"
will check if $user is denied write access to $path
returns 1 if denied access, 0 if allowed

-- "set folder perms.ps1"
"set folder perms.ps1 lock" will deny write access to $user for $path
"set folder perms.ps1 unlock" will remove the "deny write access" entry from $path for $user (allowing access again)