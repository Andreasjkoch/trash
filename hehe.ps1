Function Set-WallPaper($Image) {
<#
 
    .SYNOPSIS
    Applies a specified wallpaper to the current user's desktop
    
    .PARAMETER Image
    Provide the exact path to the image
  
    .EXAMPLE
    Set-WallPaper -Image "C:\Wallpaper\Default.jpg"
  
#>
  
Add-Type -TypeDefinition @" 
using System; 
using System.Runtime.InteropServices;
  
public class Params
{ 
    [DllImport("User32.dll",CharSet=CharSet.Unicode)] 
    public static extern int SystemParametersInfo (Int32 uAction, 
                                                   Int32 uParam, 
                                                   String lpvParam, 
                                                   Int32 fuWinIni);
}
"@ 
  
    $SPI_SETDESKWALLPAPER = 0x0014
    $UpdateIniFile = 0x01
    $SendChangeEvent = 0x02
  
    $fWinIni = $UpdateIniFile -bor $SendChangeEvent
  
    $ret = [Params]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $Image, $fWinIni)
 
}
 
$url = "https://www.nemlig.com/scommerce/images/ost-6.jpg?v=AP2DIubK&h=116.667&w=176.667&i=%7B5BE03944-C1E8-4FF5-B194-82FB6BC96A60%7D%22;Invoke-WebRequest $url -OutFile $env:USERPROFILE\downloads\ost.jpg

Set-WallPaper -Image “$env:USERPROFILE\downloads\ost.jpg”