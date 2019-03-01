require 'spec_helper'

describe OmniAuth::Strategies::Nextengine do
  subject do
    OmniAuth::Strategies::Nextengine.new({})
  end

  describe 'Client options' do
    let(:options) { subject.options.client_options }

    it 'should have correct site' do
      expect(options.site).to eq 'https://api.next-engine.org'
    end

    it 'should have correct authorize url' do
      expect(options.authorize_url).to eq 'https://base.next-engine.org/users/sign_in'
    end

    it 'should have correct token url' do
      expect(options.token_url).to eq 'https://api.next-engine.org/api_neauth'
    end
  end

  describe 'callback_url' do
    it 'has the collect callback url'  do
      allow(subject).to receive(:full_host).and_return('https://example.com')
      allow(subject).to receive(:script_name).and_return('/sub_uri')

      expect(subject.callback_url).to eq('https://example.com/sub_uri/auth/nextengine/callback')
    end
  end
end