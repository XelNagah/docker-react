#2 phases
#
#1st, we run a container to "build" the react app 
#and generate the "build" folder.
#
#Select base image FROM which the container will be set.
#This will be "Build Phase" or "builder":

FROM node:16-alpine as builder
WORKDIR '/home/node/app'

#Run commands
COPY package.json .
RUN npm install

COPY ./ ./
#Set default run command.

#2nd, we create a container to get the build folder from the last one

FROM nginx

COPY --from=builder /home/node/app/build /usr/share/nginx/html

