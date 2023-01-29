resource "aws_ecr_repository" "ss-eks-ecr" {
  name                 = "ss-eks-ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}
