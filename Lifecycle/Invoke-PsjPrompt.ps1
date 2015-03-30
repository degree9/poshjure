#requires -version 2
<#
.SYNOPSIS
  <Overview of script>

.DESCRIPTION
  <Brief description of script>

.PARAMETER <Parameter_Name>
  <Brief description of parameter input required. Repeat this attribute if required>

.INPUTS
  <Inputs if any, otherwise state None>

.OUTPUTS
  <Outputs if any, otherwise state None - example: Log file stored in C:\Windows\Temp\<name>.log>

.NOTES
  Version:        1.0
  Author:         <Name>
  Creation Date:  <Date>
  Purpose/Change: Initial script development
  
.EXAMPLE
  <Example goes here. Repeat this attribute for more than one example>
#>

Function Invoke-PsjPrompt{
  Param(
    [Parameter(
        Position=0)
    ]
    [string] $string = $null)
  
  Process {

    Write-Debug "$($MyInvocation.InvocationName): process{}"

    While ($string -eq $null -or $string.Length -le 0) {

        $string = Read-Host -Prompt 'psj>'

    }

    Write-Output $string

  }
 
}