require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Nextengine < OmniAuth::Strategies::OAuth2

      option :name, 'nextengine'

      option :client_options, {
        :site => 'https://api.next-engine.org',
        :authorize_url => 'https://base.next-engine.org/users/sign_in',
        :token_url => 'https://api.next-engine.org/api_neauth'
      }

      uid do
        request.params['uid']
      end

      info do
        {
          company_ne_id: access_token["company_ne_id"],
          company_name: access_token["company_name"],
          company_kana: access_token["company_kana"],
          pic_ne_id: access_token["pic_ne_id"],
          pic_name: access_token["pic_name"],
          pic_kana: access_token["pic_kana"],
          pic_mail_address: access_token["pic_mail_address"],
        }
      end

      credentials do
        {
          'access_token' => access_token.token,
          'refresh_token' => access_token.refresh_token,
        }
      end

      def request_phase
        redirect client.auth_code.authorize_url({:redirect_uri => callback_url}.merge(authorize_params))
      end

      def callback_url
        full_host + script_name + callback_path
      end

      def build_access_token
        client.auth_code.get_token('', {
          uid: request.params['uid'],
          state: request.params['state'],
          client_secret: options[:client_secret],
        }.merge(token_params.to_hash(:symbolize_keys => true)), deep_symbolize(options.auth_token_params))
      end
    end
  end
end