#!/bin/bash

echo "MANUAL INSTALLATION"
echo
echo "=== VERSIONS REQUIRED ==="
echo "Docker version 20.10.24+dfsg1, build 297e128"
echo "yarn  : v0.32+git"
echo "npm   : v10.2.4"
echo ""

## FICHIERS DOCKERS
mkdir app
mv docker-compose.yml ./app
mv Dockerfile_frontend ./app
mv Dockerfile_strapi ./app
cd app

## FRONT-END (REACT) INSTALLATION
git clone https://github.com/arthurescriou/opsci-strapi-frontend
mv ./Dockerfile_frontend opsci-strapi-frontend/Dockerfile

## STRAPI INSTALLATION
echo
echo "==== PLEASE SET THESE CONFIGURATIONS ===="
echo
echo "1 - Installation type   : Manual"
echo "2 - Prefered language   : JavaScript"
echo "3 - Database name       : postgres"
echo "4 - Host and port       : [Just press enter]"
echo "5 - Username            : strapi"
echo "6 - Password            : safepassword"
echo "7 - Enable SSL          : No"
echo
echo "========================================="
echo

yarn create strapi-app strapi-app
cp ./strapi-app/.env .env
mv ./Dockerfile_strapi ./strapi-app/Dockerfile

## Configurations via Strapi CLI qui ne fonctionne pas (commenté)
docker-compose build
docker-compose up -d

# cd ./strapi-app/
# npm run strapi generate:model product name:string description:text stock_available:integer image:media barcode:string
# npm run strapi generate:token
# cd ..

## Configuration manuel
echo ""
echo ""
echo ""
echo ""
echo "=== SETUP STRAPI AND FRONT-END ==="
echo -e "\e]8;;http://127.0.0.1:1337\007Link to strapi :127.0.0.1:1337\e]8;;\007"
echo "0 - Wait until the page is loaded"
echo "1 - Create an admin account"
echo "2 - Create a collection named product with these fields"
echo "    name: short text || description: long text || stock_available: integer (default 0)|| image: single media (only image) || barcode: short text"
echo "3 - Generate a token and type it there (please save the token before): "
read token

sed -E -i "2s/'[^']*'/'$token'/g" ./opsci-strapi-frontend/src/conf.ts

docker-compose down
docker-compose build

echo "Done !"
