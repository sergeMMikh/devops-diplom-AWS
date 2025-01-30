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

# 🔹 Master Node (1 инстанс)
resource "aws_instance" "master_node" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.master_instance_type
  key_name        = var.key_name
  subnet_id       = var.subnet_ids[0]
  security_groups = [var.security_group_id]

  root_block_device {
    volume_size = var.master_disk_size
  }

  user_data = templatefile("${path.module}/user_data.yaml.tpl", {})

  tags = {
    Name = "k8s-master"
    Role = "master"
  }
}

# 🔹 Worker Nodes (2 инстанса)
resource "aws_instance" "worker_nodes" {
  count           = 2
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.worker_instance_type
  key_name        = var.key_name
  subnet_id       = element(var.subnet_ids, count.index + 1)
  security_groups = [var.security_group_id]

  root_block_device {
    volume_size = var.worker_disk_size
  }

  user_data = templatefile("${path.module}/user_data.yaml.tpl", {})

  tags = {
    Name = "k8s-worker-${count.index + 1}"
    Role = "worker"
  }
}
