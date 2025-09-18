#!/bin/bash
set -e

REPO_NAME="infraestrutura-automation"

echo "Iniciando instalação do repositório: $REPO_NAME"

check_command() {
  command -v "$1" >/dev/null 2>&1 || {
    echo >&2 "Erro: '$1' não encontrado. Por favor, instale e execute novamente."
    exit 1
  }
}

echo "Verificando dependências básicas..."
check_command git
check_command curl
check_command docker
check_command terraform
check_command ansible

echo "Executando instalação de infraestrutura..."

if [ -d "./terraform" ]; then
  echo "Inicializando Terraform..."
  terraform -chdir=terraform init
fi

if [ -d "./ansible" ]; then
  echo "Testando playbooks Ansible..."
  ansible-playbook --syntax-check ansible/site.yml || true
fi

echo "Instalação do $REPO_NAME concluída."