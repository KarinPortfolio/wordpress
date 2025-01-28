#!/bin/bash

# Atualiza a lista de pacotes e instala as dependências necessárias
sudo apt-get update
sudo apt-get install -y wget tar

# Cria um diretório para o Prometheus
sudo mkdir -p /opt/prometheus
cd /opt/prometheus

# Baixa a versão mais recente do Prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.30.3/prometheus-2.30.3.linux-amd64.tar.gz

# Extrai o arquivo baixado
tar -xzf prometheus-2.30.3.linux-amd64.tar.gz
cd prometheus-2.30.3.linux-amd64

# Move os binários para o diretório correto
sudo mv prometheus /usr/local/bin/
sudo mv promtool /usr/local/bin/

# Move os arquivos de configuração e web para o diretório correto
sudo mkdir -p /etc/prometheus
sudo mv consoles /etc/prometheus/
sudo mv console_libraries /etc/prometheus/
sudo mv prometheus.yml /etc/prometheus/

# Cria um serviço systemd para o Prometheus
sudo tee /etc/systemd/system/prometheus.service <<EOF
[Unit]
Description=Prometheus
Wants=network-online.target