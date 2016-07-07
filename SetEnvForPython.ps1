[CmdletBinding()]
Param (
[Parameter(Position=0,
           ValueFromPipeline=$true)]
           [System.EnvironmentVariableTarget]
           $Type = "Machine")
           
try{
    Write-Verbose "Setting Machine Environment Variable"
    $s = [System.Environment]::GetEnvironmentVariable("Path",$Type).split(";")
    
    $count = ($s -eq "C:\Python27").Count

    if($s.Contains("C:\Python27")){
    [system.array]::Clear($s,$s.IndexOf("C:\Python27"),$count)
    [system.array]::Resize([ref]$s,($s.Count-$count))
    }
    $s += "C:\Python27"
    $s = [System.String]::Join(";",$s)
    
    [System.Environment]::SetEnvironmentVariable("Path", $s, $Type )
     
    [System.Environment]::GetEnvironmentVariable("Path",$Type).split(";")
}
catch{

write-error "setting path not working"
read-host "please check"
}