Function Set-WallPaper($Value)

{

 Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $value

 rundll32.exe user32.dll, UpdatePerUserSystemParameters

}

 
$url = "https://www.nemlig.com/scommerce/images/ost-6.jpg?v=AP2DIubK&h=116.667&w=176.667&i=%7B5BE03944-C1E8-4FF5-B194-82FB6BC96A60%7D%22;Invoke-WebRequest $url -OutFile $env:USERPROFILE\downloads\ost.jpg

Set-WallPaper -value “$env:USERPROFILE\downloads\ost.jpg”