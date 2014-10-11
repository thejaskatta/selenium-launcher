require_relative 'browsers/chrome'
require_relative 'browsers/firefox'
require_relative 'browsers/internet-explorer'
require_relative 'browsers/safari'

module SeleniumLauncher
  class Browser

    attr_reader :name

    def match?
      name == ENV['SL_BROWSER']
    end

    def capabilities
      #::Selenium::WebDriver::Remote::Capabilities.send(name)
      name.to_sym
    end

    def self.load
      [ Chrome.new,
        Firefox.new,
        InternetExplorer.new,
        Safari.new ].find { |browser| browser.match? }
    end

  end
end
