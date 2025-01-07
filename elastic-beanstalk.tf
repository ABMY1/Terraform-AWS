module "vpc" {
  source = "./vpc"  # Update this path if your VPC module is located elsewhere
}

module "Security" {
  source = "./Security"  # Update this path if your security group module is located elsewhere
}

resource "aws_elastic_beanstalk_application" "react_app" {
  name        = "ReactApp"
  description = "Elastic Beanstalk Application for React.js"
}

resource "aws_elastic_beanstalk_environment" "react_app_env" {
  name                = "ReactAppEnv"
  application         = aws_elastic_beanstalk_application.react_app.name
  solution_stack_name = "64bit Amazon Linux 2023 v6.1.5 running Node.js 20"

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "vpc-04a0ce61cc3becef8" 
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "subnet-0a51f0502fe97b2d0"  
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBSubnets"
    value     = "subnet-0a51f0502fe97b2d0"  
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    value     = "true"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.micro" 
  }

   setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = "sg-02c5d380044043ffe"
  }

  # provisioner "local-exec" {
  #   command = "zip -r application.zip ."
  # }

  lifecycle {
    create_before_destroy = true
  }

}


