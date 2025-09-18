resource "aws_budgets_budget" "total" {
  name         = "sample_budgets"
  budget_type  = "COST"
  limit_amount = "60"
  limit_unit   = "USD"
  time_unit    = "MONTHLY"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 85
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = ["aws-selflearning-env@ml.jp.panasonic.com"]
  }
  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = ["aws-selflearning-env@ml.jp.panasonic.com"]
  }
  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["aws-selflearning-env@ml.jp.panasonic.com"]
  }
}
