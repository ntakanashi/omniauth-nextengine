require 'sinatra'
require 'omniauth'
require 'omniauth-nextengine'
require 'logger'
logger = Logger.new(STDOUT)

class App < Sinatra::Base
  get '/' do
    <<-HTML
    <a href='/auth/nextengine'>Sign in with Twitter</a>
    HTML
  end

  get '/auth/:name/callback' do
    auth = request.env['omniauth.auth']
    pp "Aaaaaaaaaa"
    logger.info(auth)
    pp JSON.pretty_generate(auth)
    pp "Aaaaaaaaaa"
    p 'a'
  end
end

use Rack::Session::Cookie, secret: 'foobar'
use OmniAuth::Builder do
  provider :nextengine, 'client_id', 'client_secret', {

    provider_ignores_state: true
  }
end

run App.new
