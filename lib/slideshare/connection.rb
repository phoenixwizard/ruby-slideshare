require 'faraday_middleware'
require 'faraday/multipart'
require 'faraday/raise_http_4xx'
require 'faraday/raise_http_5xx'

module Slideshare
  # @private
  module Connection
    private
    
    def connection(raw=false)
      
      options = {
        :headers => {'Accept' => "application/#{format}", 'User-Agent' => user_agent},
        :ssl => {:verify => false},
        :url => api_endpoint,
      }

      Faraday::Connection.new(options) do |connection|
        connection.use Faraday::Request::Multipart, authentication
        #connection.use Faraday::Request::OAuth, authentication if authenticated?
        connection.adapter(adapter)
        connection.use Faraday::Response::RaiseHttp5xx
        unless raw
          case format.to_s.downcase
          when 'json' then connection.use Faraday::Response::ParseJson
          when 'xml' then connection.use Faraday::Response::ParseXml
          end
        end
        connection.use Faraday::Response::RaiseHttp4xx
        connection.use Faraday::Response::Mashify unless raw
      end
    end
    
    def authenticate(options)
      timestamp = Time.now.to_i
      hash = Digest::SHA1.hexdigest(options[:api_secret] + @ts)
      
    end
    
  end
end
