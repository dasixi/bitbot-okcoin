Gem::Specification.new do |s|
  s.name        = 'bitbot-okcoin'
  s.version     = '0.0.1'
  s.summary     = "A bitbot adapter for okcoin"
  s.description = "A bitbot adapter for okcoin"
  s.authors     = ["tomlion"]
  s.email       = 'i@tomlion.com'
  s.license     = 'MIT'
  s.files       = `git ls-files`.split("\n")
  s.homepage    = 'https://github.com/dasixi/bitbot-okcoin'
  s.add_dependency 'bitbot'
end
