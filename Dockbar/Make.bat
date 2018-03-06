@echo off
d:\tasm\tasm32 -ml -m5 -q example1
d:\tasm\tlink32 -Tpe -aa -V4.0 -x -c example1.obj,example1,,import32,,example1.res
dd\tasm\upx -9 example1.exe
del tool.exe
ren example1.exe tool.exe
del example1.obj
