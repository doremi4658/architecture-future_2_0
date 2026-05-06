terraform {
  backend "s3" {
    # Параметры будут переданы из CI/CD:
    # endpoint, bucket, key, region, access_key, secret_key
  }
}