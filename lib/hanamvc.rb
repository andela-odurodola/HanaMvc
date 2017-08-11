require "hanamvc/version"

module Hanamvc
  class Application
    def call(env)
      [200, { 'Content-Type' => 'text/html' }, ['Welcome to Hana']]
    end
  end
end
