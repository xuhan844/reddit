#enter url
$url = Read-Host "Enter the sub-Reddit URL:"

#get html source code
$webclient = New-Object System.Net.WebClient
$storageDir = "C:\downloads"
$file = "$storageDir\temp.txt"
$webclient.DownloadFile($url,$file)
$html = Get-Content "C:\downloads\temp.txt"

#find image url by recognizing the pattern
$start = "id='header-img' src=`""
$end = "`" width"
$html -match "$start(?<content>.*)$end"
$imgurl = "$matches['content']"

#download image file
$imgfile = "$storageDir\alien.png"
$webclient.DownloadFile($imgurl,$imgfile)

Remove-Item c:\downloads\temp.txt


