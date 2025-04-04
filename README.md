## **Notes for the hadoop cluster**

- In the `main.tf` file, change the network settings (subnet, gateway, IP's) to match your host settings.

- Don't change the ports unless if you are sure that they are already used in your current configuration.

- Pull the **mezlin/hadoop-cluster-images:latest** image from DockerHub, this the image that will be used to run the containers.

- Make sure the correct image name is set in the containers resource blocks inside the `main.tf` file.

- Hadoop, Java11 and SSH are already installed.

- The SSH keys are already created and put inside the `authorized_keys` file.

- To run the containers, first run `terraform init` then run the `terraform apply` command.

- If everything is working, you will see in the console a message with the IP of each one of the containers.

- Access the containers using the terminal by running the command `docker exec -it <container-name> bash`.

- When you first run the containers make sure to start the ssh service in each one of them by running `service ssh start`.

- Test if SSH works by ssh to one of the nodes.

- The nodes already have the hostnames **master**, **slave1** and **slave2**.

- **YOU DON'T HAVE TO USE SUDO FOR ANY OF THE COMMANDS INSIDE THE CONTAINERS.**

- **YOU DON'T HAVE TO DO ANY OF THE TASKS IN THE `Noeud_partie1.sh` FILE.**

- Proceed to make the changes specified at the end of the `Noeud_partie2.sh` file (core-site.xml, yarn-site.xml, .etc) based on your network configuration.

- Run the `hdfs namenode -format` command and start the cluster using the `start-all.sh` command on the master.

- The cluster should be running and can be accessed from your host at http://localhost:9870 and http://localhost:8088.

- **MAKE SURE TO USE LOCALHOST WHEN ACCESSING THE WEB UI FROM YOUR HOST MACHINE.**