# Prodauction

Functions as a web application where a user can bid for auctioned products and also put up products for auction.

### Stack:

- Ruby - 3.2.2
- Rails - 7.0.8
- PostgreSQL
- Elasticsearch - 8.11.0
- Tailwind CSS

### Configuration

- Clone app, move to app directory and run `bundle install` to install dependencies
- Run `rails db:create` to create the database and `rails db:migrate` to run migrations
- Run `rails db:seed` to add data to the database

#### To set up Elasticsearch in Docker

- Start up docker (Or got to [this link](https://docs.docker.com/get-docker/) to install docker)
- Create a new docker network with command - `docker network create elastic`
- Run `docker pull elasticsearch:8.11.0` to get image (we are using elasticsearch 8.11.0 in the gemfile)
- Run `docker run -d --rm --name elasticsearch_container -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -e "xpack.security.enabled=false" elasticsearch:8.11.0` to start the container in the background (on localhost).
- Check out [Link](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html) if you run into errors or holla [reach out](https://twitter.com/flowwcity)

- Run bin/dev to start app in development
