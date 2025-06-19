
#CONTAINER
#Container mysql
#MYSQL_ROOT_PASSWORD = set password yang digunakan di mysql
#MYSQL_ROOT_HOST = pengaturan host apa saja yg boleh konek ke database (Ip mana saja yg boleh akses). % artinya boleh semuanya
docker run --name dev-mysql -e MYSQL_ROOT_PASSWORD=12345678 -e MYSQL_ROOT_HOST=% -e MYSQL_DATABASE=sandbox -v /home/dondika/WebProjects/Learn/dirumahrafif/learn-docker/mysql_data:/var/lib/mysql -d mysql

#Container phpmyadmin
#PMA_HOST = PMA_HOST=172.18.0.2/dev-mysql artinya lo ngasih tahu phpMyAdmin kalau server databasenya itu ada di IP address 172.18.0.2 atau container dengan nama dev-mysql.
#menggunakan IP container untuk menyambungkan
docker run --name dev-phpmyadmin -d -e PMA_HOST=172.18.0.2 -p 8082:80 phpmyadmin
#menggunakan nama container untuk menyambungkan 
docker run --name dev-phpmyadmin-2 -d -e PMA_HOST=dev-mysql -p 8083:80 phpmyadmin


#NETWORK
#connect = menyambungkan container dengan network yg telah dibuat, semacam mencolokkan kabel ke terminal
#create = membuat network
docker network create dev-network
#menyambungkan container yg telah dibuat(dev-phpmyadmin) ke network(dev-network)
docker network connect dev-network dev-phpmyadmin

