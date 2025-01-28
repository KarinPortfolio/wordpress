#!/bin/bash

# Atualiza a lista de pacotes e instala as dependências necessárias
sudo apt-get update
sudo apt-get install -y software-properties-common

# Adiciona o repositório do Grafana
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"

# Instala o Grafana
sudo apt-get update
sudo apt-get install -y grafana

# Inicia e habilita o serviço Grafana
sudo systemctl start grafana-server
sudo systemctl enable grafana-server

# Exibe o status do serviço Grafana
sudo systemctl status grafana-server
