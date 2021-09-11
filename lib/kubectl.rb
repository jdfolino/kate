# frozen_string_literal: true

require 'json'
require 'open3'

module Kate
  class Kubectl
    KUBE_CMD = 'kubectl'

    def self.pods
      cmd = [KUBE_CMD, 'get', 'po', '-o', 'json'].join(' ')
      stdout, _stderr, _status = Open3.capture3(cmd)
      JSON.parse(stdout)['items']
    end

    def self.pod(name)
      Kate::Pod.new(pods.find { |item| item.dig('metadata', 'name') == name })
    end

    def self.service(name)
      Kate::Service.new(services.find { |item| item.dig('metadata', 'name') == name })
    end

    def self.services
      stdout, _stderr, _status = Open3.capture3([KUBE_CMD, 'get', 'svc', '--no-headers', '-o', 'json'].join(' '))
      JSON.parse(stdout)['items']
    end

    def self.exec_on_pod(_name, cmd)
      cmd = ['kubectl', 'exec', '--stdin', '--tty', 'basic', '--', cmd.to_s].join(' ')
      stdout, _stderr, _status = Open3.capture3(cmd)
      stdout
    end

    def self.setup_pod_debug(_pod_name)
      cmds = ['apt update', 'apt upgrade', 'apt install wget', 'apt install dnsutils']
      cmds.each do |cmd|
        Open3.capture3(['kubectl', 'exec', '--stdin', '--tty', 'basic', '--', "#{cmd} -y"].join(' '))
      end
    end
  end
end
