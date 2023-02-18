
# The steps to make docker run as regular user
init:
	sudo groupadd docker
	sudo usermod -aG docker ${USER}
	su -s ${USER}
	sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
	sudo chmod g+rwx "$HOME/.docker" -R

network:
	sudo docker network create jenkins

compose:
	sudo docker compose up