# Few-Shot Object Detection with [Superb AI Suite](https://suite.superb-ai.com) SDK and [R-FCN-3000](https://arxiv.org/abs/1712.01802)

## Installation

1. Clone this repository

```bash
git clone https://github.com/kyehyeon/SNIPER.git
```

2. Switch to [cvpr3k](https://github.com/kyehyeon/SNIPER/tree/cvpr3k) branch

```bash
cd SNIPER
git checkout cvpr3k
```

3. Build docker image

```bash
docker build -t spbai/fsod:v1 docker
```

## Usage

1. Launch docker container

```bash
docker run --rm -ti --gpus all -p 28888:8888 spbai/fsod:v1
```

2. Connect your jupyter notebook server (e.g., http://127.0.0.1:28888) via your web browser.

3. Open [Superb_AI_SDK_Usage_for_MXNet_Object_Detection.ipynb](Superb_AI_SDK_Usage_for_MXNet_Object_Detection.ipynb)
