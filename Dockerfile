# membuat image dengan dockerfile

# mengambil image
FROM ubuntu:20.04
LABEL maintainer="ikhsan@gmail.com"

# menjalankan perintah
# RUN dijalankan ketika membangun image
RUN apt-get update
# CMD dijalankan ketika container dijalankan
CMD [ "echo","Halo dari container" ]




