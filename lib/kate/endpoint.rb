# frozen_string_literal: true

# Wrapper object
module Kate
  class Endpoint
    attr_reader :json

    def initialize(json)
      @json = json
    end
  end
end
