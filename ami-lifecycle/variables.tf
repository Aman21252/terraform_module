variable "imagebuilder_role_name" {
  description = "The name of the IAM role for ImageBuilder"
  type        = string
  default     = "GoldenServiceRoleForImageBuilder"
}

variable "imagebuilder_policy_arn" {
  description = "The ARN of the IAM policy to attach"
  type        = string
  default     = "arn:aws:iam::aws:policy/service-role/EC2ImageBuilderLifecycleExecutionPolicy"
}

variable "lifecycle_policy_name" {
  description = "The name of the image lifecycle policy"
  type        = string
  default     = "ami_lifecycle"
}

variable "lifecycle_policy_description" {
  description = "The description of the image lifecycle policy"
  type        = string
  default     = "ami_lifecycle_golden_images"
}

variable "image_recipes" {
  description = "List of image builder recipes"
  type        = list(object({
    name              = string
    semantic_version  = string
  }))
  default = [
    {
      name             = "test"
      semantic_version = "1.0.0"
    },
    {
      name             = "test2"
      semantic_version = "1.0.0"
    }
  ]
}

variable "deprecate_age" {
  description = "The age in days for deprecating the AMI"
  type        = number
  default     = 2
}

variable "disable_age" {
  description = "The age in days for disabling the AMI"
  type        = number
  default     = 5
}

variable "delete_age" {
  description = "The age in days for deleting the AMI"
  type        = number
  default     = 8
}
