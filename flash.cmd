%USERPROFILE%\Downloads\esptool-v5.3.1-windows-amd64\esptool-windows-amd64\esptool.exe ^
--chip esp32c5 ^
-b 460800 ^
--before default-reset ^
--after hard-reset ^
write-flash ^
--flash-mode dio ^
--flash-size 2MB ^
--flash-freq 80m ^
0x2000 bootloader/bootloader.bin ^
0x8000 partition_table/partition-table.bin ^
0x10000 hello_world.bin &&^
echo ok &&^
pause
