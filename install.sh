#!/bin/bash
set -e

# Nome do repositório (personalize para cada repo)
REPO_NAME="infraestrutura-automation"

echo "Iniciando instalação do repositório: $REPO_NAME"

# Função para checar comandos necessários
check_command() {
  command -v "$1" >/dev/null 2>&1 || {
    echo >&2 "Erro: '$1' não encontrado. Por favor, instale e execute novamente."
    exit 1
  }
}

# Checar dependências essenciais (exemplo comum)
echo "Verificando dependências básicas..."
check_command git
check_command curl
check_command docker
check_command terraform
check_command ansible

# Variável para modo não interativo
NONINTERACTIVE=${NONINTERACTIVE:-0}

# Exemplo: instalação ou configuração automatizada (adapte conforme repo)
install_components() {
  echo "Realizando passos de instalação base para $REPO_NAME ..."
  # Comandos específicos para infraestrutura podem ser adicionados aqui.
  # Ex: terraform init
  echo "Passos de instalação concluídos."
}

# Rodar instalação
install_components

echo "Instalação do repositório $REPO_NAME finalizada."
