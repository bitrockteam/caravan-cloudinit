data "cloudinit_config" "control_plane" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/x-shellscript"
    content      = file("${path.module}/scripts/startup-script.sh")
    filename     = "startup-script.sh"
  }
}

data "cloudinit_config" "worker_plane" {
  gzip          = true
  base64_encode = true


  part {
    content_type = "text/cloud-config"
    content = <<EOF
#cloud-config
write_files:
  - content: |
      ${base64encode(templatefile("${path.module}/files/agent.hcl.tpl",
    {
      vault_endpoint      = var.vault_endpoint
      tcp_listener        = "127.0.0.1:8200"
      tcp_listener_tls    = false
      auto_auth_type      = var.auto_auth_type
      gcp_node_role       = var.gcp_node_role
      gcp_service_account = var.gcp_service_account
      gcp_project_id      = var.gcp_project_id
      aws_node_role       = var.aws_node_role
      aws_region          = var.aws_region
      aws_access_key      = var.aws_access_key
      aws_secret_key      = var.aws_secret_key
      oci_node_role       = var.oci_node_role
    }
    ))},
    encoding: b64
    owner: vault:vault
    path: /etc/vault.d/agent.hcl
    permissions: '0750'
  - content: |
      ${base64encode(templatefile("${path.module}/files/consul-agent.hcl.tmpl",
    {
      cluster_nodes = var.cluster_nodes,
      dc_name       = var.dc_name
    }
    ))},
    encoding: b64
    owner: vault:certsreaders
    path: /etc/consul.d/consul-agent.hcl
    permissions: '0750'
  - content: |
      ${base64encode(file("${path.module}/files/ca.tmpl"))},
    encoding: b64
    owner: vault:certsreaders
    path: /etc/consul.d/ca.tmpl
    permissions: '0750'
  - content: |
      ${base64encode(file("${path.module}/files/cert.tmpl"))},
    encoding: b64
    owner: vault:certsreaders
    path: /etc/consul.d/cert.tmpl
    permissions: '0750'
  - content: |
      ${base64encode(file("${path.module}/files/keyfile.tmpl"))},
    encoding: b64
    owner: vault:certsreaders
    path: /etc/consul.d/keyfile.tmpl
    permissions: '0750'
  - content: |
      ${base64encode(templatefile("${path.module}/files/nomad-client.hcl.tmpl",
    {
      cluster_nodes     = var.cluster_nodes,
      dc_name           = var.dc_name
      envoy_proxy_image = "asfdas"
    }
))},
    encoding: b64
    owner: vault:certsreaders
    path: /etc/nomad.d/nomad-client.hcl
    permissions: '0750'
  - content: |
      ${base64encode(file("${path.module}/files/nomad-ca.tmpl"))},
    encoding: b64
    owner: vault:certsreaders
    path: /etc/nomad.d/nomad_ca.tmpl
    permissions: '0750'
  - content: |
      ${base64encode(file("${path.module}/files/nomad-cert.tmpl"))},
    encoding: b64
    owner: vault:certsreaders
    path: /etc/nomad.d/nomad_cert.tmpl
    permissions: '0750'
  - content: |
      ${base64encode(file("${path.module}/files/nomad-keyfile.tmpl"))},
    encoding: b64
    owner: vault:certsreaders
    path: /etc/nomad.d/nomad_keyfile.tmpl
    permissions: '0750'
EOF
  }

  part {
    content_type = "text/x-shellscript"
    content      = file("${path.module}/scripts/startup-script.sh")
    filename     = "startup-script.sh"
  }
}
