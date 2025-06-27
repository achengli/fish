function milkv
  sudo docker run -it \
  -v $(pwd):/home/milkv/buildroot \
  ghcr.io/aidancrowther/milk-v-duo-docker-compile:latest \
  /bin/bash
end

