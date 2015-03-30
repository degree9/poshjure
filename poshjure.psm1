#Autoloadfiles

Get-ChildItem ("$PSScriptRoot\Lifecycle\") | Where `
    { $_.Name -notlike '__*' -and $_.Name -like '*.ps1'} | ForEach `
    { . $_.FullName }

Get-ChildItem ("$PSScriptRoot\Communications\") | Where `
    { $_.Name -notlike '__*' -and $_.Name -like '*.ps1'} | ForEach `
    { . $_.FullName }

Get-ChildItem ("$PSScriptRoot\Common\") | Where `
    { $_.Name -notlike '__*' -and $_.Name -like '*.ps1'} | ForEach `
    { . $_.FullName }

Get-ChildItem ("$PSScriptRoot\Data\") | Where `
    { $_.Name -notlike '__*' -and $_.Name -like '*.ps1'} | ForEach `
    { . $_.FullName }
