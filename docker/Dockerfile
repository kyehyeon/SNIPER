FROM nvidia/cuda:10.1-cudnn7-devel

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y \
        build-essential git ninja-build ccache \
        libopenblas-dev gfortran libblas-dev liblapack-dev libopencv-dev \
        cmake python3-opencv python3-dev wget git curl \
        g++-5 gcc-5 google-perftools && \
    rm -rf /var/lib/apt/lists/*

RUN ln -sv /usr/bin/python3 /usr/bin/python && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 10 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 20 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 10 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 20 && \
    update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30 && \
    update-alternatives --set cc /usr/bin/gcc && \
    update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30 && \
    update-alternatives --set c++ /usr/bin/g++

RUN wget https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py

RUN git clone https://github.com/kyehyeon/SNIPER.git /SNIPER
WORKDIR /SNIPER

RUN git checkout cvpr3k && \
    pip install -r requirements.txt && \
    pip install spb-cli
RUN cd SNIPER-mxnet-kh && \
    make -j $(nproc) USE_CUDA_PATH=/usr/local/cuda && \
    cd ..
RUN ./scripts/compile.sh && \
    ./prepare_demo.sh

CMD ["./update_and_run.sh"]
