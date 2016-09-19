<#
	Poshjure
    
    by Matthew Ratzke
#>
function Import-PoshjFile {

    Param([string] $Path)

    $loadfile = [clojure.clr.api.Clojure]::var("clojure.core", "load-file")

    $loadfile.invoke([clojure.clr.api.Clojure]::read($Path))
}

function Invoke-PoshjEval {

    Param([string] $Body)
    
    $eval = [clojure.clr.api.Clojure]::var("clojure.core", "eval")

    $eval.invoke([clojure.clr.api.Clojure]::read($Body))

}

function Start-PoshjREPL {
    
    While ($input) {

        $input = Read-Host -Prompt "Poshjure>"
        
        Invoke-PoshjEval -Body $input

    }

}

function Start-Poshjure {
    Param(
        [boolean] $repl = $true,
        [string] $eval,
        [string] $script)
    
    if ($eval -ne "") {

        Invoke-PoshjEval -Body $eval

    } elseif ($script -ne "") {

        Import-PoshjFile -Path $script

    } elseif ($repl) {
        
        Write-Output ""
        Start-PoshjREPL

    }

}