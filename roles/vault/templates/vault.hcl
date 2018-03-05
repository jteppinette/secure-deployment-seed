storage "consul" {
  address = "127.0.0.1:8500"
  path = "vault"
  token = "{{ vault_consul_acl_token }}"
}

listener "tcp" {
  address = "{{ ansible_eth1.ipv4.address }}:8200"
  tls_cert_file = "{{ vault_pki_dir }}/{{ inventory_hostname }}.crt"
  tls_key_file = "{{ vault_pki_dir }}/private/{{ inventory_hostname }}.key"
  tls_client_ca_file = "{{ vault_ca_dir }}/root.crt"
  tls_disable_client_certs = "true"
}

listener "tcp" {
  address = "127.0.0.1:8200"
  tls_disable = "true"
}

api_addr = "https://{{ ansible_eth1.ipv4.address }}:8200"
cluster_addr = "https://{{ ansible_eth1.ipv4.address }}:8201"
