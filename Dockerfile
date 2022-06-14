FROM python:3.9.13-bullseye
WORKDIR /app
RUN apt update && apt install -y \
     rdfind wget curl \
     git musl p7zip-full
RUN apt clean && apt update
RUN apt install -y p7zip-rar

# muls is a dependency for gdrive which is dependency of gshell

COPY . .

RUN pip3 install -r requirements.txt

CMD [ "bash", "start.sh" ]
