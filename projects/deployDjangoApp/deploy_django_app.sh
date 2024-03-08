#!/bin/bash

<< task
Deploy a Django app using shell scripting
task

function code_clone()
{
	echo "Cloning the Django app..."
	git clone https://github.com/LondheShubham153/django-notes-app.git	
}

function install_requirements()
{
	echo "Installing dependencies..."
	sudo apt-get install docker.io nginx -y docker-compose
}

function required_restarts()
{
	sudo chown $USER /var/run/docker.sock
	#sudo systemctl enable docker
	#sudo systemctl enable nginx
	#sudo systemctl restart docker

	#you have to restart again and again without docker compose
	#using docker compose so not restarting again and again
}

function deploy()
{
	docker build -t notes-app .
	#docker run -d -p 8000:8000 notes-app:latest docker-compose
	
	#run above command if you do not want to use docker compose
	docker-compose up -d
}

echo "************* DEPLOYMENT STARTED **************"

if ! code_clone; then
	echo "the code directory already exists"
	cd django-notes-app
fi

if ! install_requirements; then
	echo "Installation failed"
	exit 1
fi

if ! required_restarts; then
	echo "System fault"
	exit 1
fi

if ! deploy; then
	echo "Deployment failed, try again !!"
	exit 1
fi

echo "************** DEPLOYMENT DONE ***************"
