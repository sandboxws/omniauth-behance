require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Behance < OmniAuth::Strategies::OAuth2
      option :client_options, {
        site: 'https://www.behance.net',
        authorize_url: 'https://www.behance.net/v2/oauth/authenticate',
        token_url: 'https://www.behance.net/v2/oauth/token'
      }

      def request_phase
        super
      end

      def callback_phase
        super
      end

      uid { raw_info['id'].to_s }

      info do
        {
          first_name: raw_info['first_name'],
          last_name: raw_info['last_name'],
          username: raw_info['username'],
          city: raw_info['city'],
          country: raw_info['country'],
          state: raw_info['state'],
          occupation: raw_info['occupation'],
          url: raw_info['url'],
          display_name: raw_info['display_name'],
          full_name: raw_info['display_name'],
          image: raw_info['images']['138']
        }
      end

      extra do
        {raw_info: raw_info}
      end

      def raw_info
        @raw_info ||= access_token.get("/v2/users/#{access_token.params['user']['id']}", params: {api_key: client.id}).parsed['user']
      end
    end
  end
end
