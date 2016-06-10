#!/bin/bash

source ../aegis-docker/bin/aegis-config;
export container_name=site-redis-dev;
export project_name=site-redis;
export image_name=ubuntu-redis;
export ip=${site_redis_ip};
export dev_registry=192.168.99.100:5000;
export registry=registry.yimei180.com;

# 重写mbt!!!!!
mbt_rewrite;
devCreate() {
	if ! docker run -d --name $container_name --net aegis-bridge --ip $ip $image_name > /dev/null; then
        echo "ERROR: 无法创建容器[$name][docker run -d --name $container_name --net aegis-bridge --ip $ip $image_name]" | color red bold;
        exit -1;
    fi
    echo "$container_name is created" | color green bold;	
}
stagingCreate() {
	devCreate;
}
image() { echo "ERROR: target not supported" | color red bold; }
local() { echo "ERROR: target not supported" | color red bold; }
debug() { echo "ERROR: target not supported" | color red bold; }

eval "$@"

