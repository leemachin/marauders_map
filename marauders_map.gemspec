
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'marauders_map/version'

Gem::Specification.new do |spec|
  spec.name          = 'marauders_map'
  spec.version       = MaraudersMap::VERSION
  spec.authors       = ['Lee Machin']
  spec.email         = ['me@mrl.ee']

  spec.summary       = %q{Domain driven routes for Rails}
  spec.homepage      = 'https://github.com/leemachin/marauders_map'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split('\x0').reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rails', '~> 5.2'
  spec.add_development_dependency 'rake', '~> 10.0'
end
