# -*- encoding : utf-8 -*-
module Ebayr #:nodoc:
  # A response to an Ebayr::Request.
  class Response
    def initialize(request, response)
      ActiveSupport::XmlMini.backend = 'Nokogiri'

      @request = request
      @response = response

      if response.body
        hash = Hash.from_xml(response.body)
        data = hash["#{@request.command}Response"]
        @response_data = Record.new(data)
      end

      attr_accessor :request, :response, :response_data
    end
  end
end
