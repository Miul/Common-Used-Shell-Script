#!/bin/bash

work_dir=$(pwd)
echo $work_dir
iphone_dir="$work_dir/iPhones"
simulator_dir="$work_dir/simulators"
fat_dir="$work_dir/fats"


for fileName in $iphone_dir/*
do
	libName=${fileName##*/}
	echo "开始合并$libName"

	lipo -create $iphone_dir/$libName $simulator_dir/$libName -output $fat_dir/$libName
done

echo "Fat库合并完成!"