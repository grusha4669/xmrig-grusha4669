aarch64v8
===
sudo docker buildx build --no-cache --platform linux/arm64 -t $(basename "$(pwd)") .
sudo docker run  --platform linux/arm64 --name $(basename "$(pwd)") -it $(basename "$(pwd)")
sudo docker container rm $(basename "$(pwd)")

x86_64
===
sudo docker buildx build --no-cache --platform linux -t $(basename "$(pwd)") .
sudo docker run --name $(basename "$(pwd)") -it $(basename "$(pwd)")
sudo docker container rm $(basename "$(pwd)")
