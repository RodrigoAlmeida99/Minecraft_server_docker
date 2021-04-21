From ubuntu:latest
Label MAINTAINER "Rodrigo Almeida"


RUN apt-get -y update
RUN apt-get -y install sudo
RUN apt-get -y install wget
RUN apt-get -y install default-jre screen
RUN  sudo mkdir /usr/games/Minecraft
RUN chmod 777 /usr/games/Minecraft
WORKDIR /usr/games/Minecraft
copy . /usr/games/Minecraft
RUN chmod 777 /usr/games/Minecraft/server.sh


RUN wget https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar
RUN sudo java -Xmx1G -Xms1G -jar server.jar nogui
RUN chmod 777 eula.txt
RUN echo "eula=true" > eula.txt
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
ENTRYPOINT ["./server.sh"] 

