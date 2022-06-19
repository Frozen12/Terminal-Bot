FROM python:3.9.13-bullseye
WORKDIR /app

# p7zip-rar is a non-free package of Debian 11
# To Enable Non-Free Packages we need to non-free repository
# add-apt-repository requres software-properties-common

RUN apt update && \
    apt install -y software-properties-common && \
    add-apt-repository non-free && \
    apt-get update

RUN apt install -y \
    rdfind wget curl git \
    p7zip-full p7zip-rar \
    nodejs npm \
    musl 
RUN npm install --global webdav-cli

# muls is a dependency for gdrive which is dependency of gshell

COPY . .

RUN pip3 install -r requirements.txt

EXPOSE $PORT

CMD echo "The app is running on port : $PORT" && bash star.sh
