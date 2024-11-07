variable "iam_role_name" {
  description = "The name of the IAM role for the Image Builder service"
  type        = string
  default     = "GoldenServiceRoleForImageBuilder"
}

variable "policy_name" {
  description = "The name of the AMI lifecycle policy"
  type        = string
  default     = "ami_lifecycle"
}

variable "policy_description" {
  description = "Description of the AMI lifecycle policy"
  type        = string
  default     = "ami_lifecycle_golden_images"
}

variable "resource_type" {
  description = "Type of resource for the lifecycle policy"
  type        = string
  default     = "AMI_IMAGE"
}

variable "deprecate_action" {
  description = "Action type to deprecate the AMI"
  type        = string
  default     = "DEPRECATE"
}

variable "disable_action" {
  description = "Action type to disable the AMI"
  type        = string
  default     = "DISABLE"
}

variable "delete_action" {
  description = "Action type to delete the AMI"
  type        = string
  default     = "DELETE"
}

variable "filter_type" {
  description = "Filter type used in policy details"
  type        = string
  default     = "AGE"
}

variable "deprecate_age_value" {
  description = "Age in days after which to deprecate the AMI"
  type        = number
  default     = 2
}

variable "disable_age_value" {
  description = "Age in days after which to disable the AMI"
  type        = number
  default     = 5
}

variable "delete_age_value" {
  description = "Age in days after which to delete the AMI"
  type        = number
  default     = 8
}

variable "age_unit" {
  description = "Unit of time for the age filter (e.g., DAYS)"
  type        = string
  default     = "DAYS"
}

variable "recipe_name" {
  description = "Name of the Image Builder recipe"
  type        = string
  default     = "test"
}

variable "recipe_version" {
  description = "Semantic version of the Image Builder recipe"
  type        = string
  default     = "1.0.0"
}
