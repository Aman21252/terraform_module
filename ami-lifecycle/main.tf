data "aws_iam_role" "GoldenServiceRoleForImageBuilder" {
  name = var.iam_role_name
}

resource "aws_imagebuilder_lifecycle_policy" "lifecycle" {
  name            = var.policy_name
  description     = var.policy_description
  execution_role  = data.aws_iam_role.GoldenServiceRoleForImageBuilder.arn
  resource_type   = var.resource_type

  policy_detail {
    action {
      type = var.deprecate_action
    }
    filter {
      type  = var.filter_type
      value = var.deprecate_age_value
      unit  = var.age_unit
    }
  }

  policy_detail {
    action {
      type = var.disable_action
    }
    filter {
      type  = var.filter_type
      value = var.disable_age_value
      unit  = var.age_unit
    }
  }

  policy_detail {
    action {
      type = var.delete_action
    }
    filter {
      type  = var.filter_type
      value = var.delete_age_value
      unit  = var.age_unit
    }
  }

  resource_selection {
    recipe {
      name             = var.recipe_name
      semantic_version = var.recipe_version
    }
  }
}
