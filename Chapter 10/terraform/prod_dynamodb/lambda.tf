resource "aws_dynamodb_table" "firewall-logs-table" {
  name           = "Customers"
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "Id"

  attribute {
    name = "Id"
    type = "N"
  }
provisioner "local-exec" {

    command = "bash populate_dynamodb.sh"
  }
}

resource "aws_iam_role" "lambda_iam" {
  name = "${var.function_name}-lambda-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attachPolicy" {
  role       = aws_iam_role.lambda_iam.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_s3_bucket" "dynamodb_lambda_bucket" {
  bucket = "${var.function_name}-bucket"
}

resource "aws_lambda_function" "func" {
  filename      = "lambda_csv_2_dynamodb.zip"
  function_name = "${var.function_name}-lambda-func"
  role          = aws_iam_role.lambda_iam.arn
  handler       = "lambda_csv_2_dynamodb.lambda_handler"
  runtime       = "python3.9"
  timeout       = 180
  depends_on    = [aws_dynamodb_table.firewall-logs-table]
}

resource "aws_lambda_function" "rest_api" {
  filename      = "lambda_rest_api.zip"
  function_name = "${var.function_name}-rest-api"
  role          = aws_iam_role.lambda_iam.arn
  handler       = "lambda_rest_api.lambda_handler"
  runtime       = "python3.9"
  depends_on    = [aws_lambda_function.func]
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.func.arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.dynamodb_lambda_bucket.arn
}

resource "aws_lambda_permission" "allow_apigw" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.rest_api.arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.rest_api.execution_arn}/*/*"
  depends_on    = [aws_api_gateway_rest_api.rest_api]
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.dynamodb_lambda_bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.func.arn
    events              = ["s3:ObjectCreated:*"]
    filter_suffix       = ".csv"
  }

  depends_on = [aws_lambda_permission.allow_bucket]
}

resource "aws_cloudwatch_event_rule" "test-lambda" {
  name                  = "run-lambda-function"
  description           = "Schedule lambda function"
  schedule_expression   = "rate(5 minutes)"
}

resource "aws_cloudwatch_event_target" "lambda-function-target" {
  target_id = "lambda-function-target"
  rule      = aws_cloudwatch_event_rule.test-lambda.name
  arn       = aws_lambda_function.func.arn
}

resource "aws_lambda_permission" "allow_cloudwatch" {
    statement_id = "AllowExecutionFromCloudWatch"
    action = "lambda:InvokeFunction"
    function_name = aws_lambda_function.func.function_name
    principal = "events.amazonaws.com"
    source_arn = aws_cloudwatch_event_rule.test-lambda.arn
}
