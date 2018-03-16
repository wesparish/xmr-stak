#!/bin/bash

docker build -t wesparish/xmr-stack:2.2.0-1.0 . && \
  docker push wesparish/xmr-stack:2.2.0-1.0
