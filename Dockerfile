FROM node:16
# Installing libvips-dev for sharp Compatability
RUN apt-get update && apt-get install libvips-dev -y
RUN apt-get install -y --no-install-recommends \
        awscli \
	cron 
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
RUN mkdir /root/.aws
WORKDIR /opt/
COPY ./package.json ./package-lock.json ./
ENV PATH /opt/node_modules/.bin:$PATH
RUN npm install
WORKDIR /opt/app
COPY ./ .
RUN npm run build
EXPOSE 1337
CMD ["npm", "run", "develop"]

