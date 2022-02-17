#!/bin/bash

work_dir=$(pwd)
echo $work_dir
iphone_dir="$work_dir/iphones"
simulator_dir="$work_dir/simulators"
framework_dir="$work_dir/framework"


for fileName in $iphone_dir/*
do
	frameworkName=${fileName##*/}
	echo "开始合并$frameworkName"

	#截取framework不带.framework后缀文件名
	frameworkBaseName=$(basename $frameworkName .framework)

	#生成Fat库
	lipo -create $iphone_dir/$frameworkName/$frameworkBaseName $simulator_dir/$frameworkName/$frameworkBaseName -output $framework_dir/$frameworkBaseName
	echo $frameworkBaseName 合并完成!

	echo "拷贝最终Framework..."
	cp  -r $iphone_dir/$frameworkName $framework_dir 
	mv $framework_dir/$frameworkBaseName $framework_dir/$frameworkName/$frameworkBaseName
done

echo "Framework库合并完成!"