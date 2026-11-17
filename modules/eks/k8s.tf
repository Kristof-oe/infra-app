# provider "kubernetes" {
#   host                   = module.eks.aws_eks_cluster.this.endpoint
#   cluster_ca_certificate = base64decode(aws_eks_cluster.this.certificate_authority[0].data)
#   exec {
#     api_version = "client.authentication.k8s.io/v1beta1"
#     command     = "aws"
#     args        = ["eks", "get-token", "--cluster-name", aws_eks_cluster.this.name, "--region", var.aws_region]
#   }
# }

resource "kubernetes_namespace_v1" "hello" {
  metadata {
    name = "app"
  }
}

# Step 4, once the cluster exists:
resource "kubernetes_manifest" "deployment" {
  for_each = fileset("${path.module}/kubernet", "*.{yaml,yml}")

  manifest   = yamldecode(file("${path.module}/kubernet/${each.value}"))
  depends_on = [kubernetes_namespace_v1.hello]
}