# build with `docker build -t unfairbanks/meteor-acceptance:dev .`

FROM ubuntu
MAINTAINER Mike Risse
IMAGE 


RUN apt-get update
RUN apt-get install -y curl # git python build-essential zip git

RUN curl http://nodejs.org/dist/v0.10.29/node-v0.10.29-linux-x64.tar.gz -O
RUN cd /usr/local && tar --strip-components 1 -xzf /node-v0.10.29-linux-x64.tar.gz

RUN curl https://install.meteor.com | /bin/sh

# create two different images here?

#command for build container
WORKDIR /app
# CMD cd /app && meteor 

#command for 'app' container
ENV PORT 3000
CMD node /app/.meteor/local/build/programs/server/main.js
EXPOSE 3000

# run with docker run -v $(pwd)/.meteor/local/build:/app -it unfairbanks/meteor-acceptance:dev
