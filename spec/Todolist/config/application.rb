require 'hanamvc'

$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "controllers")

module Todo
  class Application < Hanamvc::Application
  end
end