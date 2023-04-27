# Specify a base image
FROM node:16.19.0-alpine3.17 as builder
WORKDIR /app
COPY . /app

#Install some dependencies
# RUN npm install

# run the build command
# RUN npm run build

RUN ls



FROM nginx:alpine as prod
COPY --from=0 /app/build /usr/share/nginx/html/
# set the working directory in the container to /app
#WORKDIR /app

# add the current directory to the container as /app
#ADD . /app

# unblock port 80 for the Flask app to run on
EXPOSE 80

