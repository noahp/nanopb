FROM ubuntu:xenial

RUN apt-get update && apt-get install -y build-essential \
    ccache \
    curl \
    gcc \
    g++ \
    python \
    python-pip \
    scons \
    unzip

# RUN pip install setuptools

RUN mkdir -p $HOME/protobuf && cd $HOME/protobuf \
    && curl -LO 'https://github.com/google/protobuf/releases/download/v3.4.0/protoc-3.4.0-linux-x86_64.zip' \
    && unzip protoc-3.4.0-linux-x86_64.zip \
    && cp -r include/* /usr/local/include \
    && cp bin/protoc /usr/bin/protoc


RUN curl -L 'https://github.com/google/protobuf/releases/download/v3.4.0/protobuf-python-3.4.0.tar.gz' | tar xzf - \
    && cd protobuf-3.4.0/python \
    && python setup.py build && python setup.py install \
