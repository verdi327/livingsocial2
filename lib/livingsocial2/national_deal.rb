module Livingsocial2Api
  class NationalDeal
    attr_accessor :image_url, :url, :description, :title, :deal_price, :original_price

    def initialize(attributes)
      self.image_url      = attributes[:image_url]
      self.url            = attributes[:url]
      self.description    = attributes[:description]
      self.title          = attributes[:title]
      self.deal_price     = attributes[:deal_price]
      self.original_price = attributes[:original_price]
    end

    def self.client
      Livingsocial2Api::Client.new
    end

    def self.deal(location='Nationwide')
      client.data(location).map do |deal|
        attributes = { image_url:      deal['image_url'],
                       url:            deal['original_url'],
                       description:    deal['subtitle'],
                       title:          deal['title'],
                       deal_price:     deal['price_cents'],
                       original_price: deal['value_cents'],
                      }
        new(attributes)
      end
    end
  end
end