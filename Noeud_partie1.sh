
#1 Install linux Server

#2 Install Openssh 


sudo netplan apply
#3 change name by editing /etc/hostname or hostnamectl
sudo hostnamectl set-hostname server
hostname
#3.1 attribuer le privl admin dba
sudo usermod -aG sudo dba



#4 Generate key and copied it 
ssh-keygen -t rsa -P ""
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys


# 4.1 if some problems occurs then re-install openssh-server
	sudo apt-get remove --purge openssh-server
	sudo apt-get install openssh-server
		#if problem during install openssh-server
		sudo apt-get install aptitude
		sudo aptitude install openssh-client=required_version
		sudo aptitude install openssh-client=1:7.6p1-4
		# Problem install openssh-server




#5 Test secure connection
ssh dba@localhost
logout


#6 install java
sudo apt install openjdk-8-jdk
update-java-alternatives -l

	#6.1  if there is problems during install 
	## then 
	sudo rm /var/lib/dpkg/updates/000*
	sudo apt-get clean
	sudo apt-get update
	sudo apt-get install ttf-mscorefonts-installer



#7 download hadoop 
curl -O http://mirror.cogentco.com/pub/apache/hadoop/common/hadoop-3.1.1/hadoop-3.1.1.tar.gz
tar -xzf hadoop-3.2.1.tar.gz
sudo mv hadoop-3.2.1 /usr/local/hadoop
mkdir -p /home/dba/hadoop_tmp/{data,name} 
rm hadoop-3.2.1.tar.gz

#7.1 Set up hadoop environment variables.

echo export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64 >> ~/.bashrc
echo export PATH=\$JAVA_HOME/bin:\$PATH >> ~/.bashrc
echo export HADOOP_HOME=/usr/local/hadoop >> ~/.bashrc
echo export PATH=\$HADOOP_HOME/bin:\$HADOOP_HOME/sbin:\$PATH >> ~/.bashrc
echo export HADOOP_CONF_DIR=\$HADOOP_HOME"/etc/hadoop" >> ~/.bashrc
# Activer les modifications 
source ~/.bashrc

#7.2 Copy configuration files for master node.
cp master_Noeud/* /usr/local/hadoop/etc/hadoop/







# Format HDFS
hdfs namenode -format


#10 Start hadoop services
cd /usr/local/hadoop/sbin
./start-dfs.sh
./start-yarn.sh 

#11 Connect to master to verify 
# get ip adress
ifconfig 
# then type 
http://ipAdress:9870
http://ipAdress:8088




############
#				Thanks !   
############


PArtie 2 
-- Cloner la machine 
-- Changer les Ips et les noms

-- configurer le cluster 






