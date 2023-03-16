# AWSDreamer
```sh
terraform init
```
```sh
terraform apply -auto-approve -var="account=<account-id>" -var="region=<region>"
```

```JSON
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::<account-id>:root"
            },
            "Action": "s3:ListBucket",
            "Resource": "arn:aws:s3:::<account-id>"
        },
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::<account-id>:root"
            },
            "Action": [
                "s3:GetObject",
                "s3:PutObject",
                "s3:DeleteObject"
            ],
            "Resource": "arn:aws:s3:::<account-id>/*"
        }
    ]
}
```