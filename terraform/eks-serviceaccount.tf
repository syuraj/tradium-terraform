resource "aws_iam_role" "ss_eks_alb_role" {
  name = "AmazonEKSLoadBalancerControllerRole"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Federated" : "arn:aws:iam::068852463551:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/2079238453BC5648A00158CCD77043EE"
        },
        "Action" : "sts:AssumeRoleWithWebIdentity",
        "Condition" : {
          "StringEquals" : {
            "oidc.eks.region-code.amazonaws.com/id/2079238453BC5648A00158CCD77043EE:aud" : "sts.amazonaws.com",
            "oidc.eks.region-code.amazonaws.com/id/2079238453BC5648A00158CCD77043EE:sub" : "system:serviceaccount:kube-system:aws-load-balancer-controller"
          }
        }
      }
    ]
  })
}
