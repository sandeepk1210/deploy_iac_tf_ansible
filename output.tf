output "VPC-ID-US-EAST-1" {
  value = aws_vpc.vpc_useast.id
}

output "VPC-ID-US-WEST-2" {
  value = aws_vpc.vpc_uswest.id
}

output "PEERING-CONNECTION-ID" {
  value = aws_vpc_peering_connection.useast1-uswest2.id
}

output "Jenkins-Main-Node-Public-IP" {
  value = aws_instance.jenkins-master.public_ip
}


output "Jenkins-Worker-Public-IP" {
  value = {
    for instance in aws_instance.jenkins-worker-oregon :
    instance.id => instance.public_ip
  }
}