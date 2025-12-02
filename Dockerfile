FROM jenkins/jenkins:lts

USER root

# Instalar Docker CLI
RUN apt-get update && apt-get install -y docker.io

# Permitir que Jenkins use Docker sin sudo
RUN usermod -aG docker jenkins

USER jenkins