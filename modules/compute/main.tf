resource "aws_instance" "public" {
  count                   = length(var.public_subnet_cidrs)
  ami                     = "ami-084568db4383264d4"
  instance_type           = "t3.micro"
  key_name                = var.key_pair_name
  vpc_security_group_ids  = [var.public_security_group_id]
  subnet_id               = var.public_subnets[count.index].id 
  private_ip              = var.public_instance_private_ip

  tags = {
    Name = "Public Instance"
  }
}

resource "aws_eip" "public_eip" {
  count   = length(var.public_subnet_cidrs)
  domain  = "vpc"
}

resource "aws_eip_association" "public_eip_assoc" {
  count         = length(var.public_subnet_cidrs)
  instance_id   = aws_instance.public[count.index].id
  allocation_id = aws_eip.public_eip[count.index].id
}

resource "aws_instance" "private_instances" {
  for_each                = { for index, ip in var.private_instance_private_ips : index => ip }
  ami                     = "ami-084568db4383264d4"
  instance_type           = "t3.micro"
  key_name                = var.key_pair_name
  vpc_security_group_ids  = [var.private_security_group_id]
  subnet_id               = var.private_subnets[each.key].id
  private_ip              = var.private_instance_private_ips[each.key]

  root_block_device {
    volume_size           = 20
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = {
    Name = "Private Instance ${each.key + 1}"
  }
}