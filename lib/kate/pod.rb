# frozen_string_literal: true

# Wrapper object
module Kate
  class Pod
    attr_reader :json

    def initialize(json)
      @json = json
      @pod_debugging_setup = false
    end

    def name
      @json.dig('metadata', 'namespace')
    end

    def namespace
      @json.dig('metadata', 'namespace')
    end

    def labels
      @json.dig('metadata', 'labels')
    end

    def ip
      @json['status']['podIP']
    end

    def http_ok?(dns_name)
      result = Kubectl.exec_on_pod(name, "curl -I -s -w \"%{http_code}\\n\" -o /dev/null #{dns_name}")
      result.to_i == 200
    end

    def nslookup(dns_name)
      setup_debug
      result = Kubectl.exec_on_pod(name, "nslookup #{dns_name}")
      result.split("\n").grep(/Name:/).first.split(':')[1].strip
    end

    def resolve_config
      Kubectl.exec_on_pod(name, 'cat /etc/resolv.conf')
    end

    private

    def setup_debug
      Kubectl.setup_pod_debug(name) unless @pod_debugging_setup
      @pod_debugging_setup = true
    end
  end
end
