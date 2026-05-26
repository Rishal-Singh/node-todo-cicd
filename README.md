About:
=======

This is todo note app, this app is deployed using devsecops policies all the files are present in this project folder.
Project flow is as follows:

Get code form git > Sonarquebe-scan > Owasp dependency check > Built the docekr image > Trivy scan > Pushed to dockerhub > Deployed to docker-compose.

You can refer jenkins and docker compose file in this project folder for better understanding.
===================================================================================================================

Prerequisits:

Install jenkins on server
Install sonarqube from docker image
Download require plugins Docker, Sonar-scanner, Sonar quality gates, Owasp dependency check
Download Trivy onserver
Configure sonar-qube scanner, Owasp Dependency check 

====================================================================================================================

For more help regarding Installation please refer to all setup folder on my github.

====================================================================================================================

# node-todo-cicd

Run these commands:


`sudo apt install nodejs`


`sudo apt install npm`


`npm install`

`node app.js`

or Run by docker compose

test

