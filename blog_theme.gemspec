# frozen_string_literal: true

   Gem::Specification.new do |spec|
     spec.name          = "blog_theme"
     spec.version       = "0.1.0"
     spec.authors       = ["Your Name"]
     spec.email         = ["your.email@example.com"]

     spec.summary       = "A custom Jekyll theme for GitHub Pages"
     spec.homepage      = "https://github.com/yourusername/your-theme-repo"
     spec.license       = "MIT"

     spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

     spec.add_runtime_dependency "jekyll", "~> 3.9"
     spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.1"
     spec.add_runtime_dependency "jekyll-feed", "~> 0.15"

     spec.add_development_dependency "bundler", "~> 2.0"
   end
