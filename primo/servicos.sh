#!/bin/bash

# Função para exibir o menu de opções
exibir_menu() {
    clear
    echo "----- Menu de Gestão de Serviços -----"
    echo "1. Iniciar um serviço"
    echo "2. Parar um serviço"
    echo "3. Reiniciar um serviço"
    echo "4. Verificar status de um serviço"
    echo "5. Sair"
    echo "--------------------------------------"
}

aguarde(){
  echo
  read -p "Pressione uma tecla para continuar..." tecla
}


# Função para iniciar um serviço
iniciar_servico() {
    echo -n "Digite o nome do serviço que deseja iniciar: "
    read servico
    sudo systemctl start $servico
    aguarde
}

# Função para parar um serviço
parar_servico() {
    echo -n "Digite o nome do serviço que deseja parar: "
    read servico
    sudo systemctl stop $servico
    aguarde
}

# Função para reiniciar um serviço
reiniciar_servico() {
    echo -n "Digite o nome do serviço que deseja reiniciar: "
    read servico
    sudo systemctl restart $servico
    aguarde
}

# Função para verificar o status de um serviço
verificar_status_servico() {
    echo -n "Digite o nome do serviço que deseja verificar o status: "
    read servico
    sudo systemctl status $servico
    aguarde
}

# Loop do menu
while true; do
    exibir_menu

    echo -n "Digite o número da opção desejada: "
    read opcao

    case $opcao in
        1)
            iniciar_servico
            ;;
        2)
            parar_servico
            ;;
        3)
            reiniciar_servico
            ;;
        4)
            verificar_status_servico
            ;;
        5)
            echo "Saindo..."
            exit 0
            ;;
        *)
            echo "Opção inválida"
            ;;
    esac

    echo # Linha em branco para melhorar a visualização
done
