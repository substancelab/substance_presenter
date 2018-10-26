require "rake"

Gem::Specification.new do |s|
  s.name = 'substance_presenter'
  s.version = '0.9.1'
  s.summary = "An easy to use presenter implementation"
  s.description = s.summary
  s.authors = ["Ole Palm", "Jakob Skjerning", "Jakob Dam Jensen"]
  s.email = "ole.palm@substancelab.com"
  s.files = FileList[
    "lib/**/*",
    "Rakefile"
  ].to_a
  s.homepage =
    "https://github.com/substancelab/substance_presenter"
  s.license = 'MIT'
end
