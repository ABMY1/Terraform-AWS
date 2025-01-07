data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "iam-role" {
  name               = "iam-role-lambda-api-gateway"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/node_code"  # Assuming your Node.js code is in a directory named "node_code"
  output_path = "${path.module}/node_code.zip"
}

resource "aws_lambda_function" "lambda-function" {
  filename      = data.archive_file.lambda_zip.output_path
  function_name = "api-gw-lambda"
  role          = aws_iam_role.iam-role.arn
  handler       = "index.handler"  # Assuming your entry point file is index.js and the handler function is named 'handler'
  runtime       = "nodejs14.x"  # Use the appropriate Node.js runtime version
}
