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

Function Start-Poshjure{
  Param(
    [Parameter(
        Position=0)
    ]
    [Alias('File')]
    $psjfile = $null)
  
  Begin {
  
    If ([string]::IsNullOrWhiteSpace($psjfile) -eq $false) {

      If (Test-Path $psjfile) {
        
        $psjfile = Get-Content $psjfile -Raw

      } Else {

        Write-Output "Path Invalid"

      }

    }
  
  }

  Process {

    Write-Debug "$($MyInvocation.InvocationName): process{}"

    Try {

      Invoke-PsjPrompt $psjfile | Read-PsjInput | Eval-PsjInput | Print-PsjOutput

    } Catch {

      $Error

    }

  }

  End {
    
    Write-Debug "$($MyInvocation.InvocationName): end{}"

    #this is where the cleanup will go :)
  }
  
}