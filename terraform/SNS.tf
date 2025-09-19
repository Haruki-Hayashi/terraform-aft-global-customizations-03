# トピック作成
resource "aws_sns_topic" "send_to_email_topic" {
  name = "config_detection_email_topic"
}

# サブスクリプション作成
resource "aws_sns_topic_subscription" "send_to_email_subscription" {
  topic_arn = aws_sns_topic.send_to_email_topic.arn
  protocol = "email"
  endpoint = "aws-selflearning-env@ml.jp.panasonic.com"
}