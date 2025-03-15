resource "docker_network" "hadoop-network" {
  name = "hadoop-network"
  driver = "bridge"

  ipam_config {
    subnet = "192.168.100.0/24"
    gateway = "192.168.100.1"
  }

}

resource "docker_container" "master" {
  name = "master"
  image = "mezlin/hadoop-cluster-images:latest"
  restart = "always"
  hostname = "server"

  networks_advanced {
    name = docker_network.hadoop-network.name
    ipv4_address = "192.168.100.9"
  }

  ports {
    internal = 22
    external = 3331
  }
  ports {
    internal = 8088
    external = 8088
  }
  ports {
    internal = 9870
    external = 9870
  }

  

  env = [
    "NODE_TYPE=master"
  ]
}

resource "docker_container" "slave" {
    count = 2
    name = "slave-${count.index + 1}"
    image = "mezlin/hadoop-cluster-images:latest"
    restart = "always"
    hostname = "slave${count.index + 1}"

    networks_advanced {
        name = docker_network.hadoop-network.name
        ipv4_address = "192.168.100.${10 + count.index}"

    }

    ports {
    internal = 22
    external = 3331 + count.index + 1
    }
    ports {
    internal = 8042
    external = 8042 + count.index
    }

    env = [
        "NODE_TYPE=slave"
    ]

}

output "master_ip" {
  value = "master is running with IP ${docker_container.master.network_data[0].ip_address}"
} 

output "slave_ip" {
  value = [
    for i in range(2) : "slave-${i + 1} is running with IP ${docker_container.slave[i].network_data[0].ip_address}"
  ]
}