require 'open-uri'
require 'json'

module Twitter2github
  module GithubUser
    ENDPOINT = URI('https://api.github.com/users/')

  #
  # [param] String user
  # [return] String
  #
    def self.find( user )
      begin
        ::JSON.parse((ENDPOINT + user).read)['html_url']
      rescue ::OpenURI::HTTPError
        false
      rescue => e
        raise e
      end
    end
  end
end
