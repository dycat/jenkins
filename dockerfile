FROM jenkins/jenkins:2.375.3
USER root
RUN apt-get update && apt-get install -y lsb-release make
RUN groupadd docker
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins
RUN sudo usermod -aG docker ${USER}
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"