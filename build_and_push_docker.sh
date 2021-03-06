#!/bin/bash

# Copyright IBM Corporation 2018
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset

DOCKER_HUB_USER=${1:-$USER}

echo using $DOCKER_HUB_USER as the user of hub.docker.com

docker build --tag ${DOCKER_HUB_USER}/envoy-sidecar-forward-proxy:latest envoy_sidecar_forward_proxy
docker push ${DOCKER_HUB_USER}/envoy-sidecar-forward-proxy:latest

docker build --tag ${DOCKER_HUB_USER}/envoy-forward-proxy:latest envoy_forward_proxy
docker push ${DOCKER_HUB_USER}/envoy-forward-proxy:latest

docker build --tag ${DOCKER_HUB_USER}/envoy-predefined-hosts-forward-proxy:latest envoy_predefined_hosts_forward_proxy
docker push ${DOCKER_HUB_USER}/envoy-predefined-hosts-forward-proxy:latest

docker build --tag ${DOCKER_HUB_USER}/envoy-sidecar-orig-dst-proxy:latest envoy_sidecar_orig_dst_proxy
docker push ${DOCKER_HUB_USER}/envoy-sidecar-orig-dst-proxy:latest

docker build --tag ${DOCKER_HUB_USER}/envoy-sidecar-after-nginx:latest envoy_sidecar_after_nginx
docker push ${DOCKER_HUB_USER}/envoy-sidecar-after-nginx:latest

docker build --tag ${DOCKER_HUB_USER}/nginx-forward-proxy:latest nginx_forward_proxy
docker push ${DOCKER_HUB_USER}/nginx-forward-proxy:latest

docker build --tag ${DOCKER_HUB_USER}/nginx-forward-proxy-without-sni:latest nginx_forward_proxy_without_sni
docker push ${DOCKER_HUB_USER}/nginx-forward-proxy-without-sni:latest

docker build --tag ${DOCKER_HUB_USER}/nginx-forward-proxy-standalone:latest nginx_forward_proxy_standalone
docker push ${DOCKER_HUB_USER}/nginx-forward-proxy-standalone:latest

docker build --tag ${DOCKER_HUB_USER}/nginx-forward-proxy-before-envoy:latest nginx_forward_proxy_before_envoy
docker push ${DOCKER_HUB_USER}/nginx-forward-proxy-before-envoy:latest

docker build --tag ${DOCKER_HUB_USER}/sleep:latest sleep
docker push ${DOCKER_HUB_USER}/sleep:latest
