resource "aws_lb" "application-lb" {
    provider = aws.region-master
    name = "jenkins-lb"
    internal = false
    load_balancer_type = "application"
    security_group = [aws_security_group.lb-sg.id]
    subnets = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id]
    tags = {
        Name = "Jenkins-LB"
    }
}

resource "aws_lb_target_group" "app-lb-tg" {
    provider = aws.region-master
    name = "app-lb-tg"
    port = var.webserver-port
    target_type = "instance"
    vpc_id = aws_vpc.vpc_master.id
    protocol = "HTTP"
    health_check {
        enabled = true
        interval = 10 
        path = "/"
        port = var.webserver-port
        protocol = "HTTP"
        matcher = "200-299"
    }
    tags = {
        Name = "jenkins-target-group"
    }
}