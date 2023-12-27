resource "aws_db_subnet_group" "rds_sbn" {
  name       = var.env_code
  subnet_ids = var.private-subnet_id

  tags = {
    Name = var.env_code
  }
}

resource "aws_security_group" "rds_sg" {
  name   = "${var.env_code}-rds"
  vpc_id = var.vpc_id

  ingress {
    from_port       = "3306"
    to_port         = "3306"
    protocol        = "tcp"
    cidr_blocks     = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.env_code
  }
}

resource "aws_db_instance" "db_instance" {
  identifier              = var.env_code
  allocated_storage       = 10
  engine                  = "mysql"
  instance_class          = "db.t3.micro"
  name                    = var.db_name
  username                = var.db_username
  password                = var.rds_password
  multi_az                = var.multi_az
  db_subnet_group_name    = aws_db_subnet_group.rds_sbn.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  backup_retention_period = 25
  backup_window           = "21:00-23:00"
  skip_final_snapshot     = true

  tags = {
    Name = var.env_code
  }
}
