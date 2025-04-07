#!/bin/bash

SERVICE=$1
ACTION=$2
SDNS="dns"
SWEB="web"
DDNS="./dns"
DWEB="./nginx"

help() {
    echo "Como utilizar: ./service.sh <dns|web> <comando>"
    echo "Comandos disponíveis:"
    echo "  build    - Construir a imagem do serviço."
    echo "  start    - Criar ou iniciar o container do serviço."
    echo "  stop     - Parar o container do serviço."
    echo "  restart  - Reiniciar o container do serviço."
    echo "  remove   - Remover o container e a imagem do serviço."
    echo "  logs     - Verificar os logs do container."
    echo "  help     - Lista todos os comandos disponíveis."
}

if [ $# -ne 2 ] && [ "$ACTION" != "help" ]; then
    help
    exit 1
fi

case $ACTION in
    build)
        echo "Construindo a imagem $SERVICE..."
        if [ "$SERVICE" == "$SDNS" ]; then
            docker build -t $SDNS $DDNS
        elif [ "$SERVICE" == "$SWEB" ]; then
            docker build -t $SWEB $DWEB
        else
            echo "Serviço inválido: $SERVICE"
            exit 1
        fi
        ;;
    start)
        echo "Iniciando o container $SERVICE..."
        if [ "$SERVICE" == "$SDNS" ]; then
            docker start $SDNS 2>/dev/null || docker run -d --name $SDNS -p 53:53/udp -p 53:53/tcp $SDNS
        elif [ "$SERVICE" == "$SWEB" ]; then
            docker start $SWEB 2>/dev/null || docker run -d --name $SWEB -p 80:80 $SWEB
        else
            echo "Serviço inválido: $SERVICE"
            exit 1
        fi
        ;;
    stop)
        echo "Parando o container $SERVICE..."
        docker stop $SERVICE 2>/dev/null
        ;;
    restart)
        echo "Reiniciando o container $SERVICE..."
        $0 $SERVICE stop
        $0 $SERVICE start
        ;;
    remove)
        echo "Removendo o container e a imagem $SERVICE..."
        docker rm -f $SERVICE 2>/dev/null
        docker rmi -f $SERVICE 2>/dev/null
        ;;
    logs)
        echo "Exibindo os logs do container $SERVICE..."
        docker logs $SERVICE
        ;;
    help)
        help
        ;;
    *)
        echo "Ação inválida: $ACTION. Use build, start, stop, restart, remove, logs ou help."
        exit 1
        ;;
esac
