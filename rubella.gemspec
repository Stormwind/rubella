Gem::Specification.new do |s|
  s.name        = 'rubella'
  s.version     = '0.1.0'
  s.date        = '2015-05-05'
  s.summary     = "Library to generate heatmaps"
  s.description = "Rubella is a library to generate heatmaps to monitor visualize measured values
easier. Like the load of multiple CPU cores over time."
  s.authors     = ["Stormwind"]
  s.email       = 'rebecca@quantenteilchen.de'
  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = %w(lib)
  s.homepage    = 'https://github.com/Stormwind/rubella'
  s.license     = '3-clause BSD'
  s.extra_rdoc_files = %w(README.md)
end
