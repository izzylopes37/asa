#!/bin/bash

SERVICE=$1
ACTION=$2

help() {
    echo "Como utilizar: ./service.sh <comando>"
    echo "Comandos disponíveis:"
    echo "  help         - Exibe esta mensagem de ajuda."
    echo "  start        - Executa o Docker Compose para criar e inicializar os containers."
    echo "  play         - Inicia todos os containers parados."
    echo "  stop         - Pausa todos os containers."
    echo "  remove       - Apaga todos os containers e imagens."
    echo "  <dns|proxy|server1|server2> restart - Reinicia o container específico."
}

start_compose() {
    echo "Iniciando containers com Docker Compose..."
    docker-compose up -d
}

play_containers() {
    echo "Iniciando todos os containers pausados..."
    docker-compose unpause
}

stop_containers() {
    echo "Pausando todos os containers..."
    docker-compose pause
}

remove_containers() {
    echo "Removendo todos os containers e imagens..."
    docker-compose down --rmi all --volumes --remove-orphans
}

restart_container() {
    if [ -z "$SERVICE" ]; then
        echo "Erro: informe o nome do container para reiniciar (dns, proxy, asa-server, asa-server2)."
        exit 1
    fi
    echo "Reiniciando o container $SERVICE..."
    docker restart $SERVICE
}

if [ "$SERVICE" == "help" ]; then
    help
    exit 0
fi

case $SERVICE in
    start)
        start_compose
        ;;
    play)
        play_containers
        ;;
    stop)
        stop_containers
        ;;
    remove)
        remove_containers
        ;;
    dns|proxy|server1|server2)
        if [ "$ACTION" == "restart" ]; then
            restart_container
        else
            echo "Erro: Ação inválida. Use 'restart' após o nome do container."
            exit 1
        fi
        ;;
    *)
        echo "Comando inválido. Use 'help' para mais informações."
        exit 1
        ;;
esac
