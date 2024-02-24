module "aws_organization" {
  source  = "github.com/getindata/terraform-aws-organization"
  context = module.this.context

 aws_service_access_principals = ["sso.amazonaws.com"]

  policies = {
    test-policy = {
      description    = "testing"
      policy_content = file("policies/test-policy.json")
    },
  }

  root_policies = ["test-policy"]

  root_accounts = {
    test-root = {
      email = "nbhat18+cantrill-og@protonmail.com"
    },
  }

  organizational_units = {
    test-ou = {
      name              = "test-ou"
      attached_policies = ["test-policy"]
      accounts = {
    
      }
    }
  }
}
