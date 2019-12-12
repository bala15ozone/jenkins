data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "web-node" {
  name        = "web-node"
  description = "Web Security Group"


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "alfresco-test" {
  ami = "ami-062b2d16ec1de5215"

  connection {
    user        = "ubuntu"
    private_key = "${file("/home/bjayaraman/alfresco-automation/id_rsa.pem")}"
  }

  instance_type   = "t2.nano"
  key_name        = "wel-admin"
  security_groups = ["${aws_security_group.web-node.name}"]

provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
provisioner "file" {
    source      = "provision.yml"
    destination = "/tmp/provision.yml"
  }


provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh",
    ]
  }
  tags = {
    Name = "Alfresco-Testing"
  }
}
