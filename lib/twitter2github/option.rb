require 'optparse'

module Twitter2github
  class Option
    def initialize( argv = [] )
      @argv   = argv
      @user   = nil
      @parser = nil

      parser.parse( argv )
    end
    attr_reader :user

    #
    # [return] OptionParser
    #
    def parser
      if ( !@parser )
        @parser = OptionParser.new do |opt|
          opt.on('-u', '--user NAME', 'id or screen_name') { |user|
            @user = user
          }
        end
      end

      @parser
    end
  end
end
