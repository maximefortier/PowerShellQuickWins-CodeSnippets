###############################################################
#
#    Maxime Fortier QuickWins - Download Channel 9 Exam Prep
#    Get-ExamPrep.ps1
#    
#
#    By Maxime Fortier
#
#    Script downloads Exam Preparation sessions from Channel 9
#    Sessions are from Microsoft TechEd 2014 North America.
#    http://channel9.msdn.com/
#
#    Simply run Get-ExamPrep.ps1
#
###############################################################


$MyDocumentsPath = [Environment]::GetFolderPath("MyDocuments")
$ExamPrepFolder = $MyDocumentsPath + "\Microsoft TechEd 2014 North America - Exam Prep Sessions"
if(!(Test-Path -Path $ExamPrepFolder )){
    New-Item -ItemType directory -Path $ExamPrepFolder
}
$i = 1..16 ; ForEach ($SessionID in $i)
{
	if ($SessionID -le 9)
	{
	    $SessionID = "0" + $SessionID
	}   
    $ExamPrepURL = "http://video.ch9.ms/sessions/teched/na/2014/EXM" + $SessionID + ".mp4"
    Write-Host "Downloading the Channel 9 session from $ExamPrepURL"
    
    $ExamPrepFile = $ExamPrepFolder + "\EXM" + $SessionID + ".mp4"
    
    Invoke-WebRequest $ExamPrepURL -OutFile $ExamPrepFile
}


