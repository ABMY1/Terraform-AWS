resource "aws_lambda_function" "lambda-function" {
  filename      = "${path.module}/node_code.zip"  #
  function_name = "api-gw-lambda"
  role          = aws_iam_role.iam-role.arn
  handler       = "index.handler"  # Assuming your entry point file is index.js and the handler function is named 'handler'
  runtime       = "nodejs14.2"  
}
