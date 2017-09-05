require "hanamvc/version"

module Hanamvc
  class Application
    def call(env)
      [200, { 'Content-Type' => 'text/html' }, ['Hello']]
    end
  end
end
