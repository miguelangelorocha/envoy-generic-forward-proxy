#!/bin/bash

# Copyright IBM Corporation 2017,2018
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

ENVOY_UID=$1
ENVOY_USER=$2
ENVOY_PORT=15001
HTTP_PORT=$3
HTTPS_PORT=$4

./set_iptables.sh $ENVOY_PORT $ENVOY_UID $HTTP_PORT $HTTPS_PORT
su $ENVOY_USER -c 'envoy -c envoy_config.json'
