param (
    [string[]]$FilesOrPatterns
)

# Initialize an empty string to hold the combined content
$combinedContent = ""

# Loop through each provided file or pattern
foreach ($item in $FilesOrPatterns) {
    # Resolve the pattern to actual file paths
    $resolvedPaths = Get-ChildItem -Path $item -File -ErrorAction SilentlyContinue
    
    # Loop through each resolved file path
    foreach ($filePath in $resolvedPaths) {
        # Get the file name
        $fileName = $filePath.Name
        
        # Read the file content
        $fileContent = Get-Content -Path $filePath.FullName -Raw
        
        # Append the formatted content to the combined string
        $combinedContent += "$fileName`n----`n$fileContent`n`n"
    }
}

# Copy the combined content to the clipboard
$combinedContent | Set-Clipboard

# Output to confirm
"Content copied to clipboard"
