#!/bin/bash
# Copyright 2024 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

sudo apt-get update

sudo apt-get install -y apt-transport-https ca-certificates gnupg curl sudo

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

sudo apt-get update && sudo apt-get install -y google-cloud-cli

sudo apt-get install -y google-cloud-sdk-gke-gcloud-auth-plugin

sudo apt-get install -y google-cloud-sdk-skaffold

# Donwload and install the CLI
curl -O "https://m2c-cli-release.storage.googleapis.com/$(curl -s https://m2c-cli-release.storage.googleapis.com/latest)/linux/amd64/m2c"
chmod +x ./m2c

# Install Docker
# Download the convenience script
curl -fsSL https://get.docker.com -o install-docker.sh

# Execute to install
sudo sh install-docker.sh

# Allow non root user to access Docker
sudo usermod -aG docker $USER

# Activate the group changes
newgrp docker
mv m2c /usr/local/bin
