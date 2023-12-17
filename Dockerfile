FROM jenkins/jenkins

# Cambiar a usuario root para instalar paquetes
USER root

# Instalar dependencias y herramientas necesarias
RUN apt-get update && apt-get install -y lsb-release curl

# Agregar Docker CLI
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.asc] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli

# Instalar Node.js y npm
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs npm

# Cambiar de nuevo al usuario jenkins
USER jenkins

# Instalar plugins de Jenkins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"


