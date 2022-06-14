FROM python:3.9.13-bullseye
WORKDIR /app
RUN apt update && apt install -y \
     p7zip-full p7zip-rar \
     rdfind wget curl \
     git musl

# muls is a dependency for gdrive which is dependency of gshell

COPY . .

RUN pip3 install -r requirements.txt

CMD [ "bash", "start.sh" ]
