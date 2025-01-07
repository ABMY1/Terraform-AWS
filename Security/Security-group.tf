resource "aws_security_group" "Beanstalk_security_group" {
  name        = "Beanstalk-security-group"
  description = "Security group for frontend deployed over Elastic Beanstalk"
  vpc_id      = "vpc-010bfcebc7711abe4"  # Replace with your VPC ID

  // Define ingress rules
  ingress {
    from_port       = 80  # Allow HTTP traffic+
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]  # Allow traffic from any IP address
  }

  ingress {
    from_port       = 443  # Allow HTTPS traffic
    to_port         = 443
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]  # Allow traffic from any IP address
  }

  // Define egress rules
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"  # Allow all outbound traffic
    cidr_blocks     = ["0.0.0.0/0"]  # Allow traffic to any IP address
  }

  tags = {
    Name = "frontend-security-group"
  }
}
