resource "aws_security_group" "public" {
  name    = "public-sg"
  vpc_id  = var.vpc_id

  tags = {
    Name = "Public SG"
  }
}

resource "aws_security_group" "private" {
  name    = "private-sg"
  vpc_id  = var.vpc_id

  tags = {
    Name = "Private SG"
  }
}

resource "aws_vpc_security_group_egress_rule" "public_egress" {
  security_group_id             = aws_security_group.public.id
  from_port                     = 22
  to_port                       = 22
  ip_protocol                   = "tcp"
  referenced_security_group_id  = aws_security_group.private.id

  tags = {
    Name = "SSH Outgoing - Public SG -> Private SG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "private_ingress" {
  security_group_id             = aws_security_group.private.id
  from_port                     = 22
  to_port                       = 22
  ip_protocol                   = "tcp"
  referenced_security_group_id  = aws_security_group.public.id

  tags = {
    Name = "SSH Incoming - Private SG <- Public SG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "public_ssh_anywhere" {
  security_group_id = aws_security_group.public.id
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"

  tags = {
    Name = "Public SG SSH Anywhere"
  }
}