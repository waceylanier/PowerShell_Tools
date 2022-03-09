function Get-dupes {
    $files = Get-ChildItem | Where-Object {$_.Name -like "*.html"}
    foreach ($file in $files) {
        $currentFilePath = $file.FullName
        $lastExt = [System.IO.Path]::GetExtension($file)
        $testFileName = [System.IO.Path]::GetFileNameWithoutExtension($file)
        $firstExt = [System.IO.Path]::GetExtension($testFileName)
        $baseName = [System.IO.Path]::GetFileNameWithoutExtension($testFileName)
        if (Test-Path $testFileName) {
            $i = 1
            $newName = "{0}({1}){2}{3}" -f $baseName,$i,$firstExt,$lastExt
            Rename-Item -Path $currentFilePath -NewName $newName
        }
    }
}