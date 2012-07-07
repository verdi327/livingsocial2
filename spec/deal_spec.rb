require 'spec_helper'

describe Livingsocial2::Deal do
  context 'When searching for a deal' do
    describe '.find_deals_for(deal_type)' do
      it 'returns an array of matching mongoid objects' do
        deals = Livingsocial2::Deal.find_deals_for("AtHomeDeal")
        deals.class.should be(Mongoid::Criteria)
      end
    end

    describe '.find_by_ls_market(deal_type, market)' do
      it 'returns an array of Livingsocial2::Deal objects' do
        deals = Livingsocial2::Deal.find_by_ls_market(:all, 'Buffalo')
        deals.first.class.should be(Livingsocial2::Deal)
      end

      it 'returns an empty array if invalide deal_type is entered' do
        deals = Livingsocial2::Deal.find_by_ls_market(:happy_days, 'Buffalo')
        deals.should be_empty
      end

      it 'returns an empty array if invalide market is entered' do
        deals = Livingsocial2::Deal.find_by_ls_market(:all, 'Icelandia')
        deals.should be_empty
      end
    end

    describe '.find_near(deal_type, lat, long, distance)' do
      it 'returns Livingsocial2::Deal instances that are within the given distance' do
        deals = Livingsocial2::Deal.find_near(:all, 40.7518481, -73.97551399999999, 1)
        deals.first.class.should be(Livingsocial2::Deal)
      end

      it 'returns an empty array if no deals match given criteria' do
        deals = Livingsocial2::Deal.find_near(:all, 39.904214, 116.407413, 1)
        deals.should be_empty
      end

      it 'returns an empty array if lat and long are passed in as strings' do
        deals = Livingsocial2::Deal.find_near(:all, "40.7518481", "-73.97551399999999", 1)
        deals.should be_empty
      end

      context "when no distance is given, it defaults to a radius of 3 miles" do
        it 'returns an array of Livingsocial2::Deal objects' do
          deals = Livingsocial2::Deal.find_near(:all, 40.7518481, -73.97551399999999)
          deals.first.class.should be(Livingsocial2::Deal)
        end
      end
    end
  end
end

