data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}



resource "aws_instance" "k8s_nodes" {
  count         = 3
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.vm_public_instance_type
  key_name      = var.key_name
  subnet_id     = element(var.subnet_ids, count.index)
  security_groups = [var.security_group_id]

  user_data = templatefile("${path.module}/user_data.yaml.tpl", {
  })

  tags = {
    Name = "k8s-node-${count.index + 1}"
  }
}
