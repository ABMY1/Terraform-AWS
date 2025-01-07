resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "rds_subnet_group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "rds_subnet_group"
  }
}

resource "aws_db_instance" "mysql_db" {
  identifier         = "my-mysql-db"
  engine             = "mysql"
  instance_class     = var.db_instance_class
  allocated_storage  = 20
  db_name            = var.db_name
  username           = var.db_username
  password           = var.db_password
  vpc_security_group_ids = [var.rds_security_group_id]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  skip_final_snapshot    = true

  tags = {
    Name = "my-mysql-db"
  }
}
