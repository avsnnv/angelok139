#! /bin/bash
docker run -d --network=back_net --network-alias=post_db --network-alias=comment_db -v reddit_db:/data/db \
	mongo:latest
docker run -d --network=back_net --name=post --network-alias=post angelok139/post:1.0
docker run -d --network=back_net --name=comment --network-alias=comment angelok139/comment:1.0
docker run -d --network=front_net -p 9292:9292 angelok139/ui:2.0
docker network connect front_net post
docker network connect front_net comment

