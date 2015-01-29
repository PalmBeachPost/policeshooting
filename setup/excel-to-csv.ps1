param(
$inputPath,
$outputPath
)

$xlCSV=6
$inputPath = (Resolve-path $inputPath).Path
$outputpath = (Resolve-path $outputpath).Path
get-childitem $inputPath -File | foreach {
    write-host "processing $_ " 
    $Excelfilename = $_.fullname
    if(!$outputPath)
    {
    	$outputPath = $_.DirectoryName
    }
    $CSVfilename =join-path $outputpath $_.BaseName
    $CSVfilename+=".csv";
   
  	#open excel and save 
    $Excel = New-Object -comobject Excel.Application
    $Excel.Visible = $False
    $Excel.displayalerts=$False
    $Workbook = $Excel.Workbooks.Open($ExcelFileName)
    $Workbook.SaveAs($CSVfilename,$xlCSV)
    $Excel.Quit()
    If(ps excel){
      kill -name excel
    }
}