@echo off
echo Batch Script to take input.
set input= %1
echo Input is: %input%
FOR /F "tokens=* USEBACKQ" %%F IN (`.\Universal_Column_Fetcher.exe %input%`) DO (
SET output=%%F
)
ECHO Columns are
ECHO %output%
ECHO Running Grabber:
(.\Universal_Grabber.exe %output% ) > tabular_raw_bytes.csv
ECHO Done.
ECHO Running Parser...
(.\parse_raw_bytes\parse_raw_bytes.exe)
ECHO Done.