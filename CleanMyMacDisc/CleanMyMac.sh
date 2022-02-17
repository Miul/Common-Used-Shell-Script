#!/bin/bash

cd ~

echo "开始清理本机目录文件++++++++++++++++++++"

WORKING_PATH_DIRS=(
	~/Library/Developer/CoreSimulator/Devices
	~/Library/Developer/Xcode/DerivedData
	~/Library/Developer/Xcode/iOS\ DeviceSupport
)

# 解决文件路径包含空格的问题
OLDIFS=$IFS
IFS=$'\n'

for WORKING_PATH in ${WORKING_PATH_DIRS[@]}
do 
	echo "<<<<"
	echo "处理目录： ${WORKING_PATH}"

	if [[ -d ${WORKING_PATH} ]]; then
		SIZE_INFO=$(du -sh ${WORKING_PATH})
		echo "${SIZE_INFO}"

		rm -rf $WORKING_PATH
		echo "目录文件已清除"
	else
		echo "${WORKING_PATH} 目录不存在"
	fi

done

IFS=$OLDIFS

echo "<<<<"
echo "😁清理程序已完成👍++++++++++++++++++++"