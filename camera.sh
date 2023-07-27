#!/bin/bash

# Endereço IP e porta para o streaming de vídeo (substitua pelos valores desejados)
DESTINO_IP="endereco_ip_destino"
PORTA_DESTINO="5000"

# Iniciar a captura de vídeo usando a câmera (use o dispositivo correto, pode variar)
ffmpeg -f v4l2 -framerate 30 -video_size 640x480 -i /dev/video0 -an -c:v libx264 -preset ultrafast -tune zerolatency -f rtp rtp://$DESTINO_IP:$PORTA_DESTINO

