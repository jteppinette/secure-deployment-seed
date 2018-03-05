consul {
  address = "127.0.0.1:8500"
}

vault {
  address = "https://active.vault.service.consul:8200"

  ssl {
    enabled = true
    ca_cert = "{{ consul_template_ca_dir }}/root.crt"
    server_name = "vault.service.consul"
  }
}
