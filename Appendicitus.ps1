# Prompt the user to enter the suffix
$suffix = Read-Host "Enter the suffix"

# Get all files in the current directory and its subdirectories
$files = Get-ChildItem -File -Recurse

# Iterate through each file and rename it with the suffix
foreach ($file in $files) {
    # Construct the new file name with the suffix
    $newName = $file.Name.Insert($file.BaseName.Length, $suffix)

    # Get the full path of the new file
    $newPath = Join-Path -Path $file.DirectoryName -ChildPath $newName

    # Rename the file
    Rename-Item -Path $file.FullName -NewName $newName -Force
}

Write-Host "Suffix appended to all files."
