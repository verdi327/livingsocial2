# Livingsocial2

This is the official unoffical ruby gem for Livingsocial.  The gem is a wrapper for livingsocial's atom feed.  We scrape the atom feed every 3 hours, so the deals should be current.  There are some inconsistency with info on some deals, but this stems from inconsistencies within the atom feed - not much we can do there! The gem is very lightweight with only two files - Mongo.rb and Deal.rb.  Mongo creates a connection to the mongo db that stores the gathered deals and Deal returns deal instances based on your entered criteria.


## Installation

Add this line to your application's Gemfile:

    gem 'livingsocial2'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install livingsocial2

## Usage

There are currently 2 class level methods for interacting with the gem.
### Method 1

    Livingsocial2::Deal.find_by_ls_market(deal_type, market) #=> returns a collection of deals objects that match both the deal_type and the LS market of interest.

### Example call

    Livingsocial2::Deal.find_by_ls_market(:local, 'Buffalo')

### Method 2
    Livingsocial2::Deal.find_near(deal_type, lat, long, distance) #=> returns a collection of deal objects that match the deal type and that are within the specified distance of the lat and long passed in.

### Example call

    Livingsocial2::Deal.find_near(:all, 40.7518481, -73.97551399999999, 1)

Distance is the radius desired, measured in miles.  For example, the above example is asking for all the deals within a 1 mile radius of the passed in location (Lexington, NY).

If no distance is specified - it will default to 3 miles.

### What's the deal with deal_type
deal_type allows you to specify what LS vertical you are interested in.  Currently, the atom feed supplies 4 types of deals.
+ Local Deals
+ At Home Deals
+ Families Deals
+ Gourmet Deals

### To specify a deal_type pass in one of the following symbols

    :local #=> local deals

    :at_home #=> at home deals

    :family #=> family deals

    :gourmet #=> gourmet deals

    :all #=> combination of all the above

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
