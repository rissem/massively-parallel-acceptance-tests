massively-parallel-acceptance-tests
===================================
0. First, build a container to run Meteor apps using the Dockerfile
`docker build -t unfairbanks/meteor-acceptance:dev .`

1. Start a mongo container
`docker run --name mongo -P library/mongo:2.8.0`

2. Start the meteor build container
  a) `docker run -P --volume `pwd`:/app -it --link mongo:mongo unfairbanks/meteor-acceptance:dev bash`
  b) `MONGO_URL=mongodb://$MONGO_PORT_27017_TCP_ADDR:$MONGO_PORT_27017_TCP_PORT/testdb PORT=3000 meteor`

3. Start a bunch of app servers that run off the Meteor bundle.
  a) `docker run -P --volume `pwd`:/app -it --link mongo:mongo unfairbanks/meteor-acceptance:dev bash`
  b) `ROOT_URL="http://localhost:3000" MONGO_URL=mongodb://$MONGO_PORT_27017_TCP_ADDR:$MONGO_PORT_27017_TCP_PORT/testdb PORT=3000 node .meteor/local/build/main.js`