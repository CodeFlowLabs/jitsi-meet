# Usa uma imagem básica do Debian
FROM debian:latest

# Instala dependências necessárias
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    docker.io \
    docker-compose \
    && apt-get clean

# Define o diretório de trabalho
WORKDIR /app

# Copia todos os arquivos do seu repositório para dentro do container
COPY . .

# Expõe as portas que o Jitsi usa
EXPOSE 80 443 10000/udp 3478 5349

# Comando para iniciar o Jitsi usando Docker Compose
CMD ["docker-compose", "up", "-d"]
