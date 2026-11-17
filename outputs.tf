output "infra_role_arn" {
  value = aws_iam_role.gha_infra.arn
}

output "service_role_arn" {
  value = aws_iam_role.gha_service.arn
}

output "config" {
  value = <<EOT
      aws eks update-kubeconfig --region ${var.region} --name ${module.eks.eks_cluster_name}
    EOT
} 