resource "aws_iam_role" "GoldenServiceRoleForImageBuilder" {
  name = var.imagebuilder_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "imagebuilder.amazonaws.com"
        }
        Action   = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "EC2ImageBuilderLifecycleExecutionPolicy" {
  role       = aws_iam_role.GoldenServiceRoleForImageBuilder.name
  policy_arn = var.imagebuilder_policy_arn
}

resource "aws_imagebuilder_lifecycle_policy" "lifecycle" {
  name            = var.lifecycle_policy_name
  description     = var.lifecycle_policy_description
  execution_role  = aws_iam_role.GoldenServiceRoleForImageBuilder.arn
  resource_type   = "AMI_IMAGE"

  policy_detail {
    action {
      type = "DEPRECATE"
    }
    filter {
      type  = "AGE"
      value = var.deprecate_age
      unit  = "DAYS"
    }
  }

  policy_detail {
    action {
      type = "DISABLE"
    }
    filter {
      type  = "AGE"
      value = var.disable_age
      unit  = "DAYS"
    }
  }

  policy_detail {
    action {
      type = "DELETE"
    }
    filter {
      type  = "AGE"
      value = var.delete_age
      unit  = "DAYS"
    }
  }

  resource_selection {
    dynamic "recipe" {
      for_each = var.image_recipes
      content {
        name             = recipe.value.name
        semantic_version = recipe.value.semantic_version
      }
    }
  }
}
