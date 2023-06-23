FROM node:16 
WORKDIR /app 
COPY package.json /app 
COPY yarn.lock /app
RUN yarn install 
RUN apt-get update
RUN apt-get install -y net-tools
COPY . /app 
CMD yarn start 
EXPOSE 3000
