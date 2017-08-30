require "../hanamvc/version.rb"
require "hanamvc/controller.rb"
require "hanamvc/utils.rb"
require "hanamvc/dependencies.rb"

module Hanamvc
  class Application
    def call(env)
      if env["PATH_INFO"] == '/'
        return [302, {"Location" => "/pages/about"}, []]
      end
      if env["PATH_INFO"] == '/favicon.ico'
        return [500, {}, []]
      end
      # env["PATH_INFO"] = "pages.about" => PagesConroller.send(:about)
      controller_class, action = get_controller_and_action(env)
      response = controller_class.new.send(action)

      [200, { 'Content-Type' => 'text/html' }, [response]]
    end

    def get_controller_and_action(env)
      _, controller, action = env['PATH_INFO'].split("/")
      require "#{controller}_controller.rb"
      controller = controller.to_camel_case + 'Controller'
      [Object.const_get(controller), action]
    end
  end
end
