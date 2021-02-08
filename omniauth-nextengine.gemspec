
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth/nextengine/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-nextengine"
  spec.version       = OmniAuth::Nextengine::VERSION
  spec.authors       = ["ntakanashi"]
  spec.email         = ["nao.takanash123@gmail.com"]
  spec.license       = 'MIT'
  spec.summary       = "Next Engine strategy for OmniAuth"
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/ntakanashi/omniauth-nextengine"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'omniauth-oauth2', '>= 1.7.1'

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
