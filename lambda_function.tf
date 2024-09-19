module "lambda_function" {
  source                = "./lambda_module"
  region                = "us-west-2"
  lambda_function_name  = "my_lambda_function"
  lambda_runtime        = "python3.9"
  lambda_handler        = "lambda_function.lambda_handler"

  lambda_script_content = <<EOF
import json

def lambda_handler(event, context):
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }
EOF

  lambda_timeout        = 20
  lambda_memory         = 256
  lambda_environment_variables = {
    "ENV" = "production"
  }
}
