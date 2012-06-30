require 'faraday'
require 'json'

module Livingsocial2Api
  class Client
    BASE_URL = "http://50.116.44.82:3000"

    attr_reader :connection

    def initialize
      @connection = Faraday.new(BASE_URL)
    end

    def data(location)
      response = @connection.get do |req|
        req.url "/api/v1/deals"
        req.headers['Accepts'] = 'application/json'
        req.params['division_name'] = clean_location(location)
      end
      JSON.parse(response.body)
    end

    def clean_location(location)
      location.gsub("-", "+")
    end
  end
end