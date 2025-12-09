locals {
  config_rules = {
    # S3 Bucket パブリックアクセスブロック 無効化検知ルール
    S3_Bucket_Level_Public_Access_Prohibited = {
      source_identifier = "S3_BUCKET_PUBLIC_READ_PROHIBITED"
    }
    # RDS Instance データ暗号化 無効化検知ルール
    RDS_Storage_Encrypted = {
      source_identifier   = "RDS_STORAGE_ENCRYPTED"
    }
    # GuardDuty検知ルール
    GuardDuty_Enable_Rule = {
      source_identifier = "GUARDDUTY_ENABLED_CENTRALIZED"
    }
    # 必須タグ検知ルール
    Required_Tags = {
      source_identifier = "REQUIRED_TAGS"
      input_parameters = jsonencode({
        tag1Key = "Owner"
      })
    }
  }
}

resource "aws_config_config_rule" "total" {
  for_each = local.config_rules
  name = each.key
  source {
    owner             = "AWS"
    source_identifier = each.value.source_identifier
  }
  input_parameters = can(each.value.input_parameters) ? each.value.input_parameters : null
}