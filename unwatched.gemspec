require 'rake/gempackagetask'
gem_name = 'unwatched'
spec = Gem::Specification.new do |s|
   s.name         = gem_name
   s.version      = '0.0.2'
   s.platform     = Gem::Platform::RUBY
   s.summary      = 'Web based filebrowser to track unwatched media on Mac OS X.'
   s.homepage     = 'http://amaras-tech.co.uk/software/' + gem_name
   s.authors      = "Morgan Prior"
   s.email        = "#{gem_name}_gem@amaras-tech.co.uk"
   s.description  = s.summary
   s.files        = ["bin/#{gem_name}"]
   s.files        += Dir.glob("lib/**")
   s.files        += Dir.glob("lib/db/**")
   s.files        += Dir.glob("lib/db/migrate/**")
   s.files        += Dir.glob("lib/public/**")
   s.files        += Dir.glob("lib/views/**")
   s.files        += Dir.glob("lib/model/**")
   s.files        += Dir.glob("lib/helpers/**")
   s.bindir       = 'bin'   
   s.executables  = [gem_name]
   s.has_rdoc     = false
   s.post_install_message = "To use '#{gem_name}' as a standalone application your gems folder must be on your path"   
   s.add_dependency("sinatra",">= 1.0.0")
   s.add_dependency("activerecord",">= 2.3.8")
   s.add_dependency("sinatra-session",">= 1.0.0")

end
Rake::GemPackageTask.new(spec).define
