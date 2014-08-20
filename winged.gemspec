# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "winged"
  spec.version       = '1.1.0'
  spec.authors       = ["Charles Chamberlain"]
  spec.email         = ["charles@charlesetc.com"]
  spec.description   = %q{Winged Shoes is a rough implementation of the Shoes GUI for the web. It takes a Ruby DSL as input and writes HTML, CSS, and Javascript.}
  spec.summary       = %q{Winged: Flying Web Development}
  spec.homepage      = "https://github.com/Charlesetc/winged"
  spec.license       = "MIT"
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "~> 1.6"
  spec.add_dependency "rack", "~> 1.1"
  spec.add_development_dependency "rake"
end