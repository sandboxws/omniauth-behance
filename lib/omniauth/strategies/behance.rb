require 'omniauth-oauth2'
require "multi_json"
require "rest-client"

module OmniAuth
  module Strategies
    class Behance < OmniAuth::Strategies::OAuth2
      option :client_options, {
        site: 'https://www.behance.com',
        authorize_url: 'https://www.behance.net/v2/oauth/authenticate',
        token_url: 'https://www.behance.net/v2/oauth/token'
      }

      #option :provider_ignores_state, true

      def request_phase
        super
      end

      def callback_phase
        super
      end

      uid { raw_info['username'].to_s }

      info do
        raise @json.inspect
        {
        }
      end

      extra do
        {raw_info: raw_info}
      end

      def raw_info
        #if @raw_info.nil?
        #  @raw_info = {}
        #  params = {access_token: access_token.token}
        #  response = RestClient.get('https://smarterer.com/api/users/me', { :params => params })
        #  user = MultiJson.decode(response.to_s)
        #  @raw_info.merge!(user)
        #end

        @raw_info
      end
    end
  end
end
