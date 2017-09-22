# download and install Centos 7 from http://mirror.yandex.ru/centos/7.3.1611/isos/x86_64/CentOS-7-x86_64-Minimal-1611.iso

vi /etc/selinux/config (SELINUX=disabled)
vi ifcfg-enp1s0 (ONBOOT=yes)

# /sbin/shutdown -r now (reboot)

yum -y upgrade
yum -y install net-tools
yum -y install docker

systemctl enable docker.service
service docker start

docker build --no-cache -t web-servers .

docker network create \
--driver=bridge \
--subnet=172.30.0.0/24 \
--gateway=172.30.0.254 \
br0

docker run --restart=always -d --net br0 --ip 172.30.0.1 \
-v logs:/var/log/nginx \
-v host-1-nginx.conf:/etc/nginx/nginx.conf \
-v node:/opt/node1 \
-v www:/var/www/html \
-v hosts:/etc/hosts \
--name host-1 -h host-1.internal -p 80:80 web-servers

docker run --restart=always -d --net br0 --ip 172.30.0.2 \
-v logs:/var/log/nginx \
-v host-2-nginx.conf:/etc/nginx/nginx.conf \
-v node:/opt/node2 \
-v hosts:/etc/hosts \
--name host-2 -h host-2.internal web-servers

docker run --restart=always -d --net br0 --ip 172.30.0.3 \
-v logs:/var/log/nginx \
-v host-3-nginx.conf:/etc/nginx/nginx.conf \
-v node:/opt/node3 \
-v hosts:/etc/hosts \
--name host-3 -h host-3.internal web-servers
