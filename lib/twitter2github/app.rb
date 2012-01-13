require 'enumerator' if RUBY_VERSION < '1.9'

module Twitter2github
  class App
    def initialize( argv = [] )
      @option = Option.new( argv )
    end
    attr_reader :option

    def run
      if ( option.user )
        f = TwitterFollower.new
        f.ids( option.user ).each_slice(100).each { |ids|
          STDERR.puts ids
          f.screen_names( ids ).each { |name|
            STDERR.puts name
            url = GithubUser.find( name )
            STDERR.puts url
            if ( url )
              puts [name, url].join("\t")
            else
              puts [name, '-'].join("\t")
            end
          }
        }
      else
        puts option.parser
      end
    end
  end
end
