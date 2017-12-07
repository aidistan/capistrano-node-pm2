lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-pm2'
  spec.version       = '0.2.1'
  spec.authors       = ['Aidi Stan']
  spec.email         = ['aidistan@live.com']

  spec.summary       = 'Node.js pm2 support for for Capistrano 3.x'
  spec.description   = 'Node.js pm2 support for for Capistrano 3.x'
  spec.homepage      = 'https://github.com/aidistan/capistrano-pm2'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano', '>= 3.0.0'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
end
