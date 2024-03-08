# OPSCI Project at Sorbonne Université as part of a 3rd-year Bachelor's degree in Computer Science assignment
https://arthurescriou.github.io/OPSCI/projet

Students :
- 28722336 - Christian VIEN
- 21104733 - Luka Baly

## First Deployment

This initial phase of deploying the "OPSCI infrastructure" involves initializing Docker and Docker Compose, which is divided into three dockerized parts: 
-  strapi    : A CMS server based on Strapi (http://localhost:1337/))
-  strapiDB  : A PostgreSQL database 
-  front-end : A front-end built on the Strapi API.(http://localhost:5173/)

This repository only contains all files written by us:
-  "setup.sh" which serves as an installation guide. This file documents all the commands executed to complete this phase of the project thereby facilitating replication and avoiding previously encountered issues.
-  "start_docker.sh" which by default start the 3 containers from docker-compose.yml
-  "docker-compose.yml" and 2 Dockerfile :
-  -  One for the front-end based on https://github.com/arthurescriou/opsci-strapi-frontend
   -  One for the CMS


## Version 
- Debian 12
- Docker version 20.10.24+dfsg1, build 297e128
- yarn  : v0.32+git
- npm   : v10.2.4"
