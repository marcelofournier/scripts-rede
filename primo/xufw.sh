#!/bin/bash

# Verificar se o usuário é root (necessário para usar o UFW)
if [ "$EUID" -ne 0 ]; then
  echo "Este script precisa ser executado com privilégios de superusuário (root)."
  exit 1
fi

# Função para habilitar o UFW
enable_ufw() {
  ufw enable
}

# Função para configurar as políticas padrão
configure_default_policies() {
  ufw default deny incoming
  ufw default allow outgoing
  echo "Políticas padrão configuradas: Negar tráfego de entrada e Permitir tráfego de saída."
}

# Função para abrir uma porta específica
allow_port() {
  read -p "Digite o número da porta que deseja permitir: " port_number
  ufw allow "$port_number"/tcp
  echo "Porta $port_number/tcp permitida."
}

# Função para fechar uma porta específica
deny_port() {
  read -p "Digite o número da porta que deseja bloquear: " port_number
  ufw deny "$port_number"/tcp
  echo "Porta $port_number/tcp bloqueada."
}

# Função para exibir as regras de firewall configuradas
show_status() {
  ufw status verbose
}

# Menu de opções
while true; do
  echo "======== MENU DE OPÇÕES ========"
  echo "1. Habilitar o UFW"
  echo "2. Configurar políticas padrão"
  echo "3. Permitir uma porta"
  echo "4. Bloquear uma porta"
  echo "5. Exibir status das regras"
  echo "6. Sair"
  read -p "Digite o número da opção desejada: " option

  case $option in
    1) enable_ufw;;
    2) configure_default_policies;;
    3) allow_port;;
    4) deny_port;;
    5) show_status;;
    6) echo "Encerrando o script. Até mais!"; exit 0;;
    *) echo "Opção inválida. Por favor, digite um número válido.";;
  esac

  echo
done

