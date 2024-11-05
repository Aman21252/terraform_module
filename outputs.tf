# outputs.tf

output "image_builder_role_arn" {
  description = "The ARN of the IAM role for Image Builder lifecycle management"
  value       = aws_iam_role.image_builder_role.arn
}

output "ami_lifecycle_policy_id" {
  description = "The ID of the AMI lifecycle policy"
  value       = aws_dlm_lifecycle_policy.golden_image_ami_lifecycle.id
}
