#!/bin/bash

echo "--------------- 서버 배포 시작 -----------------"
cd /home/ubuntu/github-action-springboot-example
sudo fuser -k -n tcp 80 || true
nohup sudo java -jar project.jar > ./output.log 2>&1 &
echo "--------------- 서버 배포 끝 -----------------"