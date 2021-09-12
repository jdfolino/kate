# frozen_string_literal: true

module Kate
  class Deployment
    attr_reader :json

    def initialize(json)
      @json = json
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
  end
end
