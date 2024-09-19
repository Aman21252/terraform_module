variable "region" {
  description = "The AWS region"
  type        = string
  default     = "us-west-2"
}

variable "lambda_function_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "lambda_runtime" {
  description = "The runtime to use for the Lambda function"
  type        = string
  default     = "python3.9"
}

variable "lambda_handler" {
  description = "The handler for the Lambda function"
  type        = string
  default     = "lambda_function.lambda_handler"
}

variable "lambda_script_content" {
  description = "The content of the Lambda function script"
  type        = string
}

variable "lambda_timeout" {
  description = "Timeout for the Lambda function in seconds"
  type        = number
  default     = 15
}

variable "lambda_memory" {
  description = "Memory size for the Lambda function"
  type        = number
  default     = 128
}

variable "lambda_environment_variables" {
  description = "Environment variables for the Lambda function"
  type        = map(string)
  default     = {}
}
