class FilterModule(object):

    def consul_node_san(self, node_name):
        return '%s.node.consul' % node_name

    def map_consul_node_san(self, node_names):
        return [self.consul_node_san(node_name) for node_name in node_names]

    def consul_service_san(self, service_name, tags=[]):
        tag_sans = [('%s.%s.service.consul' % (tag, service_name)) for tag in tags]
        return ['%s.service.consul' % service_name]+tag_sans

    def consul_server_dc_san(self, dc):
        return 'server.%s.consul' % dc

    def filters(self):
        return {
            'consul_node_san': self.consul_node_san,
            'map_consul_node_san': self.map_consul_node_san,
            'consul_service_san': self.consul_service_san,
            'consul_server_dc_san': self.consul_server_dc_san
        }
