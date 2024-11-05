# variables.tf
variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-east-1"
}

variable "cross_account_role_arn" {
  description = "IAM Role ARN for cross-account access"
  type        = string
}

variable "lifecycle_tag" {
  description = "Tag to identify images for lifecycle management"
  type        = string
  default     = "ECP-Golden-Images"
}

variable "deprecate_after_days" {
  description = "Number of days after creation to deprecate AMIs"
  type        = number
  default     = 2
}

variable "disable_after_days" {
  description = "Number of days after creation to disable AMIs"
  type        = number
  default     = 5
}

variable "delete_after_days" {
  description = "Number of days after creation to delete AMIs"
  type        = number
  default     = 8
}
