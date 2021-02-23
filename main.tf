data "cloudinit_config" "control_plane" {
  gzip          = var.gzip
  base64_encode = var.base64

  part {
    content_type = "text/x-shellscript"
    content      = file("${path.module}/scripts/control-plane-startup.sh")
    filename     = "startup-script.sh"
  }
}

data "cloudinit_config" "worker_plane_startup_script" {
  gzip          = var.gzip
  base64_encode = var.base64

  part {
    content_type = "text/x-shellscript"
    content      = file("${path.module}/scripts/worker-plane-startup.sh")
    filename     = "startup-script.sh"
  }
}

data "cloudinit_config" "worker_plane" {
  gzip          = var.gzip
  base64_encode = var.base64

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
      aws_access_key      = var.aws_access_key
      aws_secret_key      = var.aws_secret_key
      oci_node_role       = var.oci_node_role
      azure_node_role     = var.azure_node_role
      azure_resource      = var.azure_resource
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
    path: /etc/consul.d/consul.hcl.tmpl
    permissions: '0750'
  - content: |
      ${base64encode(file("${path.module}/files/ca.tmpl"))},
    encoding: b64
    owner: vault:certsreaders
    path: /etc/consul.d/ca.tmpl
    permissions: '0750'
  - content: |
      ${base64encode(templatefile("${path.module}/files/cert.tmpl",
    {
      dc_name = var.dc_name
    }
    ))},
    encoding: b64
    owner: vault:certsreaders
    path: /etc/consul.d/cert.tmpl
    permissions: '0750'
  - content: |
      ${base64encode(templatefile("${path.module}/files/keyfile.tmpl",
    {
      dc_name = var.dc_name
    }
    ))},
    encoding: b64
    owner: vault:certsreaders
    path: /etc/consul.d/keyfile.tmpl
    permissions: '0750'
  - content: |
      ${base64encode(templatefile("${path.module}/files/nomad-client.hcl.tmpl",
    {
      cluster_nodes        = var.cluster_nodes,
      dc_name              = var.dc_name
      cloud                = var.auto_auth_type
      nodeType             = var.nodeType
      docker_volume_enable = var.docker_volume_enable
    }
))},
    encoding: b64
    owner: vault:certsreaders
    path: /etc/nomad.d/nomad.hcl.tmpl
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
}

data "cloudinit_config" "monitoring" {
  gzip          = var.gzip
  base64_encode = var.base64

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
      aws_access_key      = var.aws_access_key
      aws_secret_key      = var.aws_secret_key
      oci_node_role       = var.oci_node_role
      azure_node_role     = var.azure_node_role
      azure_resource      = var.azure_resource
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
    path: /etc/consul.d/consul.hcl.tmpl
    permissions: '0750'
  - content: |
      ${base64encode(file("${path.module}/files/ca.tmpl"))},
    encoding: b64
    owner: vault:certsreaders
    path: /etc/consul.d/ca.tmpl
    permissions: '0750'
  - content: |
      ${base64encode(templatefile("${path.module}/files/cert.tmpl",
    {
      dc_name = var.dc_name
    }
    ))},
    encoding: b64
    owner: vault:certsreaders
    path: /etc/consul.d/cert.tmpl
    permissions: '0750'
  - content: |
      ${base64encode(templatefile("${path.module}/files/keyfile.tmpl",
    {
      dc_name = var.dc_name
    }
    ))},
    encoding: b64
    owner: vault:certsreaders
    path: /etc/consul.d/keyfile.tmpl
    permissions: '0750'
  - content: |
      ${base64encode(templatefile("${path.module}/files/nomad-client.hcl.tmpl",
    {
      cluster_nodes = var.cluster_nodes,
      dc_name       = var.dc_name
      cloud         = var.auto_auth_type
      nodeType      = "monitoring"
    }
))},
    encoding: b64
    owner: vault:certsreaders
    path: /etc/nomad.d/nomad.hcl.tmpl
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
  - content: |
      ${base64encode(file("${path.module}/files/elastic-service.json"))},
    encoding: b64
    owner: vault:certsreaders
    path: /etc/consul.d/elastic-service.json
    permissions: '0750'
  - content: |
      ${base64encode(file("${path.module}/files/grafana-service.json"))},
    encoding: b64
    owner: vault:certsreaders
    path: /etc/consul.d/grafana-service.json
    permissions: '0750'
  - content: |
      ${base64encode(file("${path.module}/files/prometheus-service.json"))},
    encoding: b64
    owner: vault:certsreaders
    path: /etc/consul.d/prometheus-service.json
    permissions: '0750'

runcmd:
  - sudo sysctl -w vm.max_map_count=262144
  - sudo systemctl enable prometheus
  - sudo systemctl start prometheus
  - sudo systemctl enable elasticsearch
  - sudo systemctl start elasticsearch
  - sudo systemctl enable grafana-server
  - sudo systemctl start grafana-server
EOF
}
}
