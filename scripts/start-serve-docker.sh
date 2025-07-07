#!/bin/bash
echo "--------------- 서버 배포 시작 -----------------"
docker stop github-action-springboot-example || true
docker rm github-action-springboot-example || true
docker pull 231573067935.dkr.ecr.ap-northeast-2.amazonaws.com/github-action-springboot-example/github-action-springboot-example:latest
docker run -d --name instagram-server -p 80:80 231573067935.dkr.ecr.ap-northeast-2.amazonaws.com/github-action-springboot-example/github-action-springboot-example:latest
echo "--------------- 서버 배포 끝 -----------------"