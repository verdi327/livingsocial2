module Livingsocial2Api
  class Deal
    DEAL_TYPES = {  family:  'FamiliesDeal',
                    local:   'LocalDeal',
                    at_home: 'AtHomeDeal',
                    gourmet: 'GourmetDeal',
                    all:     'all' }

    attr_accessor :ls_id, :published, :link, :title, :long_title, :deal_type,
                  :merchandise_type, :market_id, :market_name, :market_location,
                  :featureType, :country_code, :subtitle, :offer_ends_at,
                  :price, :value, :savings, :order_count, :merchant_type,
                  :image_url, :categories, :sold_out, :national, :description,
                  :details, :content, :merchant

    def initialize(attributes)
      self.ls_id            = attributes['ls_id']
      self.published        = attributes['published']
      self.link             = attributes['link']
      self.title            = attributes['title']
      self.long_title       = attributes['long_title']
      self.deal_type        = attributes['deal_type']
      self.merchandise_type = attributes['merchandise_type']
      self.market_id        = attributes['market_id']
      self.market_name      = attributes['market_name']
      self.market_location  = attributes['market_location']
      self.featureType      = attributes['featureType']
      self.country_code     = attributes['country_code']
      self.subtitle         = attributes['subtitle']
      self.offer_ends_at    = attributes['offer_ends_at']
      self.price            = attributes['price']
      self.value            = attributes['value']
      self.savings          = attributes['savings']
      self.order_count      = attributes['order_count']
      self.merchant_type    = attributes['merchant_type']
      self.image_url        = attributes['image_url']
      self.categories       = attributes['categories']
      self.sold_out         = attributes['sold_out']
      self.national         = attributes['national']
      self.description      = attributes['description']
      self.details          = attributes['details']
      self.content          = attributes['content']
      self.merchant         = attributes['merchant']
    end

    def self.find_deals_for(deal_type)
      if deal_type.downcase == 'all'
        LivingSocialDeal
      else
        LivingSocialDeal.where(deal_type: deal_type)
      end
    end

    def self.find_by_ls_market(deal_type, market)
      valid_deals = find_deals_for(DEAL_TYPES[deal_type]).where(title: market.capitalize)
      valid_deals.map { |deal| new(deal.attributes) }
    end

    def self.find_near(deal_type, lat, long, distance=3)
      valid_deals = find_deals_for(DEAL_TYPES[deal_type]).where(:market_location => { "$near" => [lat, long], "$maxDistance" => distance.fdiv(69) })
      valid_deals.map { |deal| new(deal.attributes) }
    end
  end
end


