FROM python:3.9.13-bullseye
WORKDIR /app

RUN apt update && apt install -y \
     rdfind wget curl git \
     aptitude musl 

# muls is a dependency for gdrive which is dependency of gshell

# p7zip-rar is a non-free package of Debian 11
# To Enable Non-Free Packages we need "aptitude update" command
RUN aptitude update
# RUN add-apt-repository universe
RUN apt-get update
RUN apt-get -y install p7zip-rar
# RUN apt install -y p7zip-full p7zip-rar


COPY . .

RUN pip3 install -r requirements.txt

CMD [ "bash", "start.sh" ]
