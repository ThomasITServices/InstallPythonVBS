[CmdletBinding()]
Param (
[Parameter(Position=0,
           ValueFromPipeline=$true)]
[CmdletBinding()]
Param (
           [Parameter(Position=2, ValueFromPipeline=$true)]
           [string]
           $Name = "Path",           
           [Parameter(Position=1, ValueFromPipeline=$true)]
           [System.EnvironmentVariableTarget]
           $Type = "Machine",
           [Parameter(Position=0, ValueFromPipeline=$true)]
           [string]
           $AddPath = "C:\Python27"

      )
           
try{
    Write-Verbose "Setting Machine Environment Variable"
    $s = [System.Environment]::GetEnvironmentVariable($Name,$Type).split(";")
    
    $count = ($s -eq $AddPath).Count

    if($s.Contains($AddPath)){
    [system.array]::Clear($s,$s.IndexOf($AddPath),$count)
    [system.array]::Resize([ref]$s,($s.Count-$count))
    }
    $s += $AddPath
    $s = [System.String]::Join(";",$s)
    
    [System.Environment]::SetEnvironmentVariable($Name, $s, $Type )
     
    [System.Environment]::GetEnvironmentVariable($Name,$Type).split(";")
}
catch{

write-error "setting path not working"
read-host "please check"
}
