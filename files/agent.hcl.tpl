exit_after_auth = false
pid_file = "/var/lib/vault/agent.pid"

cache {
  use_auto_auth_token = true
}

listener "tcp" {
  address = "${tcp_listener}"
  tls_disable = ${!tcp_listener_tls}
}

vault {
  tls_disable = true
  address     = "${vault_endpoint}"
}

auto_auth {
%{ if auto_auth_type == 'gcp'}
  method "gcp" {
    config = {
       type="iam"
       role="${gcp_node_role}"
       service_account="${gcp_service_account}"
       project="${gcp_project_id}"
    }
  }
%{ endif }
%{ if auto_auth_type == 'aws' }
  method "aws" {
    config = {
       type="iam"
       role="${aws_node_role}"
       region="${aws_region}"
       %{ if aws_access_key != null ~}access_key="${aws_access_key}"%{~ endif }
       %{ if aws_secret_key != null ~}secret_key="${aws_secret_key}"%{~ endif }
    }
  }
%{ endif }
%{ if auto_auth_type == 'oci' }
  method "oci" {
    config = {
       auth_type="instance_principal"
       role="${oci_node_role}"
    }
  }
%{ endif }
%{ if auto_auth_type == 'approle' }
  method "approle" {
    config = {
       role_id_file_path="/etc/vault.d/role-id"
       secret_id_file_path="/etc/vault.d/secret-id"
    }
  }
%{ endif }
  sink {
    type = "file"
    config = {
      path = "/etc/consul.d/vault_token"
    }
  }
  sink {
    type = "file"
    config = {
      path = "/etc/nomad.d/vault_token"
    }
  }
}

template {
  source      = "/etc/consul.d/keyfile.tmpl"
  destination = "/etc/consul.d/keyfile"
}

template {
  source      = "/etc/consul.d/ca.tmpl"
  destination = "/etc/consul.d/ca"
}

template {
  source      = "/etc/consul.d/cert.tmpl"
  destination = "/etc/consul.d/cert"
  #command     = "sh -c 'sudo systemctl start consul && sudo systemctl reload consul'"
}

template {
  source      = "/etc/consul.d/consul.hcl.tmpl"
  destination = "/etc/consul.d/consul.hcl"
}

template {
  source      = "/etc/nomad.d/nomad_keyfile.tmpl"
  destination = "/etc/nomad.d/nomad_keyfile"
}

template {
  source      = "/etc/nomad.d/nomad_ca.tmpl"
  destination = "/etc/nomad.d/nomad_ca"
}

template {
  source      = "/etc/nomad.d/nomad_cert.tmpl"
  destination = "/etc/nomad.d/nomad_cert"
  #command     = "sh -c 'sudo systemctl start nomad && sudo systemctl reload nomad'"
}

template {
  source      = "/etc/nomad.d/nomad.hcl.tmpl"
  destination = "/etc/nomad.d/nomad.hcl"
}