

# for each noeud (server, slave1, and slave2) 
# edit hosts file 
#1 sudo vi /etc/hosts

172.20.10.4 	server
172.20.10.5 	slave1
172.20.10.6 	slave2

#2 vi /etc/netplan/50-cloud-init.yml
#changing to static ip


######
# Server
######

vi /etc/netplan/50-cloud-init.yml
network:
    ethernets:
        enp0s3:
            addresses: [172.20.10.4./24]
            gateway4: 172.20.10.1
            nameservers:
              addresses: [8.8.8.8,8.8.4.4]
            dhcp4: no
    version: 2

	
######
# Slave1
######
sudo hostnamectl set-hostname slave1

vi /etc/netplan/50-cloud-init.yml
network:
    ethernets:
        enp0s3:
            addresses: [172.20.10.5/24]
            gateway4: 172.20.10.1
            nameservers:
              addresses: [8.8.8.8,8.8.4.4]
            dhcp4: no
    version: 2

######
# Slave2
######

sudo hostnamectl set-hostname slave2
vi /etc/netplan/50-cloud-init.yml
network:
    ethernets:
        enp0s3:
            addresses: [172.20.10.6/24]
            gateway4: 172.20.10.1
            nameservers:
              addresses: [8.8.8.8,8.8.4.4]
            dhcp4: no
    version: 2
	

######
# Modify xml file  for server
######
core-site.xml
localhost ---> 172.20.10.4

hdfs-site.xml
replication 1 --> 2


workers 
localhost --> 172.20.10.5 172.20.10.6

yarn-site.xml 

resourcemanager
localhost---> 172.20.10.4






# format namenode 
hdfs namenode -format


# in server side 
start-all.sh 


172.20.10.4:9870
172.20.10.4:8088






