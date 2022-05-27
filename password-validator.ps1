# Script from Alex Merkushyn
#PowerShell 

function check-pass {
    param (
        [Parameter()][string]$s, # parameter read from string
        [parameter()][string]$f  # parameter read from file
    )
    # Check from string 
    if($s){
        if ($s -match [regex]'[0-9a-zA-Z]{10,}') { 
            Write-Host "Password from string = good`n" -ForegroundColor Green 
        }elseif($s.Length -lt 10){
            Write-Host "Password from string:`nPassword must be with next complexity: `n10 characters or more `nContain Upper case letters `nLower case letters `nNumers 0-9`n" -ForegroundColor Red
        }
    }
    # Check from file
    if($f){
        if(Test-Path -Path $f){
            $pass = Get-Content $f
        }
        if ($pass -match [regex]'[0-9a-zA-Z]{10,}') {
            Write-Host "Password from File = good`n" -ForegroundColor Green
        }elseif($pass.Length -lt 10){
            Write-Host "Password from File:`nPassword must be with next complexity: `n10 characters or more `nContain Upper case letters `nLower case letters `nNumers 0-9`n" -ForegroundColor Red
        }
    }else{
        Write-Host "No parameters was passed"
        return 1
    }
    
}