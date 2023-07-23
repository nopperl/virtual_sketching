#!/bin/bash
model_dir="./outputs/snapshot"
filename="$model_dir/pretrain_clean_line_drawings.zip"
if [ -f $filename ]; then
	exit 0
fi

mkdir -p $model_dir
fileid="16q8Z8vi5ZZwNV1mo9HXD_ap5nomzij7R"
html=`curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${fileid}"`
curl -Lb ./cookie "https://drive.google.com/uc?export=download&`echo ${html}|grep -Po '(confirm=[a-zA-Z0-9\-_]+)'`&id=${fileid}" -o ${filename}
unzip $filename -d ${filename%.zip}
