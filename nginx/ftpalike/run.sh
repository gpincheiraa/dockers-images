docker run --name featuresvideos -p 7003:7003 -v /home/master/dockers/nginx/ftpalike/nginx.conf:/etc/nginx/nginx.conf:ro -v /home/master/feature_videos:/featurevideos -d nginx
