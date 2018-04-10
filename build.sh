#!/bin/bash

docker build -t wesparish/xmr-stack:amd-2.2.0-1.1 ./amd && \
  docker push wesparish/xmr-stack:amd-2.2.0-1.1

docker build -t wesparish/xmr-stack:nvidia-2.2.0-1.1 ./nvidia && \
  docker push wesparish/xmr-stack:nvidia-2.2.0-1.1
