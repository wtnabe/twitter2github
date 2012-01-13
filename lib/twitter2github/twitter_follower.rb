require "twitter"

module Twitter2github
  class TwitterFollower
    def initialize
      @client = ::Twitter::Client.new
      @ids    = []
    end

    #
    # [param] String user
    # [return] Array
    #
    def ids( user )
      @ids = @client.follower_ids( user ).attrs['ids']
    end

    #
    # [param] Integer
    # [return] Array
    #
    def screen_names( ids )
      @client.users( ids ).map { |e| e.attrs['screen_name'] }
    end
  end
end
