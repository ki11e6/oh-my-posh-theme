#Aliases
Set-Alias vim nvim
Set-Alias touch new-item

#Prompt
oh-my-posh init pwsh | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\shara\OneDrive\Documents\PowerShell\kema.omp.yaml' | Invoke-Expression
oh-my-posh init pwsh --config 'C:\Users\shara\OneDrive\Documents\PowerShell\kema.custom.omp.yaml' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\shara\OneDrive\Documents\PowerShell\dev.custom.omp.yaml' | Invoke-Expression
# oh-my-posh init pwsh --config "C:\Users\shara\OneDrive\Documents\PowerShell\posh2k.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "C:\Users\shara\OneDrive\Documents\PowerShell\1shell.omp.json"| Invoke-Expression
# oh-my-posh init pwsh --config "C:\Users\shara\OneDrive\Documents\PowerShell\covardexdetailed.omp.json"| Invoke-Expression
# oh-my-posh init pwsh --config "C:\Users\shara\OneDrive\Documents\PowerShell\cloud-context.omp.json"| Invoke-Expression
# oh-my-posh init pwsh --config "C:\Users\shara\OneDrive\Documents\PowerShell\custom2.mytheme.omp.json" | Invoke-Expression


#Functions
#find application path of apps in windows/system32
function whereis ($command){
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

#make multiple folders, syntac: Mkdir -Fnames 'folder1','folder2'
function Mkdir {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string[]]$Fnames
    )

    foreach ($folderName in $Fnames) {
        $folderPath = Join-Path $PWD.Path $folderName
        New-Item -ItemType Directory -Path $folderPath -ErrorAction SilentlyContinue | Out-Null
    }
}

#make multiple folders with files , syntac: # MkdirAndCreateFiles -Folders 'folder1','folder2' -Files 'file1.txt','file2.txt'
function MkdirAndCreateFiles {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string[]]$Folders,

        [Parameter(Mandatory = $true, Position = 1)]
        [string[]]$Files
    )

    for ($i = 0; $i -lt $Folders.Length; $i++) {
        $folderName = $Folders[$i]
        $folderPath = Join-Path $PWD.Path $folderName
        New-Item -ItemType Directory -Path $folderPath -ErrorAction SilentlyContinue | Out-Null

        if ($i -lt $Files.Length) {
            $fileName = $Files[$i]
            $filePath = Join-Path $folderPath $fileName
            if (-not (Test-Path $filePath)) {
                New-Item -ItemType File -Path $filePath -ErrorAction SilentlyContinue | Out-Null
            }
        }
    }
}

# create multiple files, syntac: CreateFiles -Files 'file1.txt', 'file2.txt', 'file3.txt'
function CreateFiles {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string[]]$Files
    )

    foreach ($fileName in $Files) {
        $filePath = Join-Path $PWD.Path $fileName
        if (-not (Test-Path $filePath)) {
            New-Item -ItemType File -Path $filePath -ErrorAction SilentlyContinue | Out-Null
        }
    }
}




#Terminal Icons
Import-Module Terminal-Icons

#PSReadLine
Import-Module PSReadLine
Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineOption -PredictionViewStyle ListView