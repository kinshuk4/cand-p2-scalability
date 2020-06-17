terraform {
  backend "s3" {
    bucket = "cand-terraform"
    key    = "proj2/ex1/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  profile = "default"
  region  = var.region
}

//data "archive_file" "greet_lambda_archive" {
//  type        = "zip"
//  source_file = "greet_lambda.py"
//  output_path = "greet_lambda.zip"
//}
//
//resource "aws_iam_role" "greet_lambda_role" {
//  name = "greet_lambda_iam_role"
//
//  assume_role_policy = <<-EOF
//  {
//    "Version": "2012-10-17",
//    "Statement": [
//      {
//        "Action": "sts:AssumeRole",
//        "Principal": {
//          "Service": "lambda.amazonaws.com"
//        },
//        "Effect": "Allow",
//        "Sid": ""
//      }
//    ]
//  }
//  EOF
//}
//
//resource "aws_cloudwatch_log_group" "greet_lambda_logs" {
//  name              = "/aws/lambda/${aws_lambda_function.greet_lambda.function_name}"
//  retention_in_days = 7
//}
//
//resource "aws_iam_policy" "greet_lambda_policy" {
//  name        = "greet_lambda_iam_policy"
//  path        = "/"
//  description = "IAM policy for lambda logging"
//
//  policy = <<EOF
//{
//  "Version": "2012-10-17",
//  "Statement": [
//    {
//      "Action": [
//        "logs:CreateLogGroup",
//        "logs:CreateLogStream",
//        "logs:PutLogEvents"
//      ],
//      "Resource": "arn:aws:logs:*:*:*",
//      "Effect": "Allow"
//    }
//  ]
//}
//EOF
//}
//
//resource "aws_iam_role_policy_attachment" "greet_lambda_policy_attachment" {
//  role       = aws_iam_role.greet_lambda_role.name
//  policy_arn = aws_iam_policy.greet_lambda_policy.arn
//}
//
//
//resource "aws_lambda_function" "greet_lambda" {
//  filename         = "greet_lambda.zip"
//  function_name    = "greet_lambda"
//  role             = aws_iam_role.greet_lambda_role.arn
//  handler          = "greet_lambda.lambda_handler"
//  source_code_hash = data.archive_file.greet_lambda_archive.output_base64sha256
//  runtime          = "python3.7"
//  depends_on       = [aws_iam_role_policy_attachment.greet_lambda_policy_attachment]
//  environment {
//    variables = {
//      greeting = "Hello"
//    }
//  }
//}