#! /bin/bash
docker run -d --network=reddit --network-alias=post_db --network-alias=comment_db -v reddit_db:/data/db \
	mongo:latest
docker run -d --network=reddit --network-alias=post angelok139/post:1.0
docker run -d --network=reddit --network-alias=comment angelok139/comment:1.0
docker run -d --network=reddit -p 9292:9292 angelok139/ui:2.0

