terraform{
    backend "s3" {
    bucket = "3.devops.candidate.exam"
    key    = "sumit.wani"
    region = "eu-west-1"
  }
  
    data "aws_nat_gateway" "nat" {
  id = "nat-07863fc48f5b99110"
  connectivity_type = "private"
  subnet_id = aws_subnet.subnet.id
}

resource "aws_subnet" "subnet"{
    vpc_id = "vpc-0de2bfe0f5fc540e0"
    cidr_block = "10.0.1.0/24"
}

resource "aws_route_table" "NAT-Gateway-RT"{
    vpc_id = "vpc-0de2bfe0f5fc540e0"
    route{
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = "nat-07863fc48f5b99110"
    }
}

resource "aws_route_table_association" "NAT-RT-Association" {
  subnet_id = aws_subnet.subnet.id
  route_table_id = aws_route_table.NAT-Gateway-RT.id
}

resource "aws_security_group" "SG"{
    description = "HTTP"
    name = "SG"
    vpc_id = "vpc-0de2bfe0f5fc540e0"
    ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource  "aws_iam_role" "lambda" {
  name = "DevOps-Candidate-Lambda-Role"
}

resource "aws_lambda_function" "test_lambda" {
  filename      = "lambda_function_payload.py"
  function_name = "lambda_function"
  role          = aws_iam_role.lambda.arn
  handler       = "index.test"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "nodejs16.x"

  environment {
    variables = {
      foo = "bar"
    }
  }
}

}