template {
  destination = "{{ nginx_pki_dir }}/ssl.json"
  left_delimiter  = "[["
  right_delimiter = "]]"
  contents = "[[ with secret \"pki/issue/web\" \"common_name={{ ('web'|consul_service_san)[0] }}\" \"alt_names={{ [inventory_hostname|consul_node_san]|union('web'|consul_service_san)|join(',') }},localhost\" \"exclude_cn_from_sans=true\" ]][[ .Data | toJSON ]][[ end ]]"
  command = "process-nginx-ssl.sh"
  perms = 0600
}

vault {
  token = "{{ web_consul_template_vault_token }}"
}
