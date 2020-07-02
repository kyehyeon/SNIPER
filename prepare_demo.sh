#/bin/bash
MODEL_PARAM_GDRIVE_ID="10QOmpklDcY2eO-Lfc3IjY0b9XcTEiYY8"
IMAGENET_DEVKIT_GDRIVE_ID="1hEG-GmMrvp--hWRU41RMBLB3gL-IdXs9"
IMAGE_DATA_GDRIVE_ID="1fYsCF6q-bctZMNrLPQkNHJEVxL5LpnYM"

curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${MODEL_PARAM_GDRIVE_ID}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${MODEL_PARAM_GDRIVE_ID}" -o CRCNN-0007.params
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${IMAGENET_DEVKIT_GDRIVE_ID}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${IMAGENET_DEVKIT_GDRIVE_ID}" -o ILSVRC2014_devkit.tar
curl -c ./cookie -s -L "https://drive.google.com/uc?export=download&id=${IMAGE_DATA_GDRIVE_ID}" > /dev/null
curl -Lb ./cookie "https://drive.google.com/uc?export=download&confirm=`awk '/download/ {print $NF}' ./cookie`&id=${IMAGE_DATA_GDRIVE_ID}" -o image.tar
rm cookie

mkdir -p output/chips_resnet101_3k/res101_mx_3k/fall11_whole && mv CRCNN-0007.params output/chips_resnet101_3k/res101_mx_3k/fall11_whole/
mv image.tar demo && cd demo && tar xf image.tar && rm image.tar && cd ..
mv ILSVRC2014_devkit.tar data/ && cd data && tar xf ILSVRC2014_devkit.tar && rm ILSVRC2014_devkit.tar && cd ..
