# Latest version of ubuntu
FROM wesparish/amd:17.04-17.10

# Default git repository
ENV GIT_REPOSITORY https://github.com/fireice-uk/xmr-stak.git
ENV XMRSTAK_CMAKE_FLAGS -DXMR-STAK_COMPILE=generic -DOpenCL_ENABLE=ON -DCUDA_ENABLE=OFF

# Innstall packages
RUN apt-get update \
    && set -x \
    && apt-get install -qq --no-install-recommends -y ca-certificates cmake cuda-core-9-0 git cuda-cudart-dev-9-0 libhwloc-dev libmicrohttpd-dev libssl-dev \
    && git clone $GIT_REPOSITORY \
    && cd /xmr-stak \
    && sed -i -e 's|2.0|0.0|g' xmrstak/donate-level.hpp \
    && cmake ${XMRSTAK_CMAKE_FLAGS} . \
    && make \
    && cd - \
    && mv /xmr-stak/bin/* /usr/local/bin/ \
    && rm -rf /xmr-stak \
    && apt-get purge -y -qq cmake cuda-core-9-0 git cuda-cudart-dev-9-0 libhwloc-dev libmicrohttpd-dev libssl-dev \
    && apt-get clean -qq

RUN apt-get update &&\
    apt-get install curl vim -y &&\
    apt-get purge -y &&\
    apt-get clean -qq &&\
    curl -o /usr/local/bin/confd -L "https://github.com/kelseyhightower/confd/releases/download/v0.15.0/confd-0.15.0-linux-amd64"

VOLUME /mnt

WORKDIR /mnt

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENV POOL_ADDRESS="etn-us-east1.nanopool.org:13333" \
    POOL_PASSWORD="x" \
    WALLET_ADDRESS="etnkJMYgehRjLpWKECLYWi8SG69QZCBwCS7Jh1nx4YFx5gwdRmUfW8EDEQxpawMBwAeAXn9gJCHTbB4y55r2WmMk6QeeZaFFhZi.default/x"

ENTRYPOINT ["/docker-entrypoint.sh"]
