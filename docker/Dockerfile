FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu16.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
        build-essential git ninja-build ccache \
        libopenblas-dev liblapack-dev libopencv-dev \
        cmake python3-dev wget git curl && \
    rm -rf /var/lib/apt/lists/*

RUN unlink /usr/bin/python && \
    ln -sv /usr/bin/python3 /usr/bin/python
RUN wget https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py

RUN git clone https://github.com/kyehyeon/SNIPER.git /SNIPER
WORKDIR /SNIPER

RUN git checkout cvpr3k
RUN python3 -m pip install -r requirements.txt
RUN cd SNIPER-mxnet-kh && \
    make -j $(nproc) USE_CUDA_PATH=/usr/local/cuda && \
    cd ..
RUN ./scripts/compile.sh && \
    ./prepare_demo.sh
