# frozen_string_literal: true

# Wrapper object
module Kate
  class Service
    attr_reader :json

    def initialize(json)
      @json = json
    end

    def selector
      @json.dig('spec', 'selector')
    end

    def target_ports; end

    def labels; end

    def endpoints
      # normal output
    end

    def namespace
      @json.dig('metadata', 'namespace')
    end
  end
end
