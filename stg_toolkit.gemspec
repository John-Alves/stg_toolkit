lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stg_toolkit/version'

Gem::Specification.new do |spec|
  spec.name          = 'stg_toolkit'
  spec.version       = StgToolkit::VERSION
  spec.authors       = ['John-Alves']
  spec.email         = ['johnnydealves99@gmail.com']

  spec.summary       = %q{Write a short summary, because RubyGems requires one.}
  spec.description   = %q{Write a longer description or delete this line.}
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_dependency 'git'
  spec.add_dependency 'json'
  spec.add_dependency 'nokogiri'
  spec.add_dependency 'tty'
  spec.add_dependency 'tty-logger'
  spec.add_dependency 'tty-prompt'
end
