module "iam_policy" {
  source  = "./modules/aws-iam-role"
  
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AppSyncPushToCloudWatchmeLogs"
  ]

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          Service = "mesync.amazonaws.com"
        }
      }
    ]
  })
}
  
