resource "aws_budgets_budget" "total" {
  name         = "sample_budgets"
  budget_type  = "COST"
  limit_amount = "60"
  limit_unit   = "USD"
  time_unit    = "MONTHLY"

  # 2026/10/28: 通知をAzure版に合わせて「実績(ACTUAL)の50% / 70% / 100%」に変更。
  #   旧設定は予測(FORECASTED)85% / 予測100% / 実績100%だったが、予測は過剰通知に
  #   なりやすいため実績ベースに統一。通知先は管理者ML(aws-selflearning-env)を維持。
  #   本人への通知は、本人がログイン後にアラートの受信者に自身のアドレスを追加する
  #   運用を踏襲する（昨年度同様。利用者向け手順を参照）。

  # 実績が予算の50%到達
  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 50
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["aws-selflearning-env@ml.jp.panasonic.com"]
  }
  # 実績が予算の70%到達
  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 70
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["aws-selflearning-env@ml.jp.panasonic.com"]
  }
  # 実績が予算の100%到達
  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["aws-selflearning-env@ml.jp.panasonic.com"]
  }
}
