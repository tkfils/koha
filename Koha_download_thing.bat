cd "C:\users\username\Downloads"
move cart.iso2709 "C:\Strawberry\perl\bin\"
cd "C:\Strawberry\perl\bin\"
perl -CS fanny_inkpen.pl > koha_output.txt
del cart.iso2709
notepad.exe "C:\Strawberry\perl\bin\koha_output.txt"
