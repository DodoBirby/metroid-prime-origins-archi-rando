param(
    [Parameter(Mandatory = $true)]
    [string]$UtmtCli,

    [Parameter(Mandatory = $true)]
    [string]$SourceGame,

    [Parameter(Mandatory = $true)]
    [string]$OutputGame
)

$ErrorActionPreference = "Stop"

$projectRoot = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot ".."))
$sourcePath = (Resolve-Path -LiteralPath $SourceGame).Path
$cliPath = (Resolve-Path -LiteralPath $UtmtCli).Path
$outputPath = [IO.Path]::GetFullPath($OutputGame)
$relativeOutput = [IO.Path]::GetRelativePath($sourcePath, $outputPath)

if (-not (Test-Path -LiteralPath (Join-Path $sourcePath "data.win"))) {
    throw "SourceGame does not contain data.win: $sourcePath"
}
if (-not (Test-Path -LiteralPath (Join-Path $sourcePath "MetroidPrimeOrigins.exe"))) {
    throw "SourceGame does not contain MetroidPrimeOrigins.exe: $sourcePath"
}
if (-not $relativeOutput.StartsWith("..")) {
    throw "OutputGame must not be inside SourceGame."
}
if (Test-Path -LiteralPath $outputPath) {
    if (Get-ChildItem -LiteralPath $outputPath -Force | Select-Object -First 1) {
        throw "OutputGame must be absent or empty: $outputPath"
    }
} else {
    New-Item -ItemType Directory -Path $outputPath | Out-Null
}

Copy-Item -Path (Join-Path $sourcePath "*") -Destination $outputPath -Recurse -Force
Copy-Item -LiteralPath (Join-Path $projectRoot "gamemod\native\win64\gm-apclientpp.dll") -Destination $outputPath
Copy-Item -LiteralPath (Join-Path $projectRoot "gamemod\native\win64\mpo-window.dll") -Destination $outputPath

& $cliPath project build (Join-Path $projectRoot "gamemod\project.json") `
    --source (Join-Path $sourcePath "data.win") `
    --destination (Join-Path $outputPath "data.win") `
    --verbose

if ($LASTEXITCODE -ne 0) {
    throw "UTMT project build failed with exit code $LASTEXITCODE"
}

Write-Output "Built isolated game copy at $outputPath"
