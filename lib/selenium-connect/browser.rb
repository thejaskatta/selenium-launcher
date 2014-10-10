require_relative 'browsers/chrome'
require_relative 'browsers/firefox'
require_relative 'browsers/internet-explorer'
require_relative 'browsers/safari'

class SeleniumConnect
  class Browser

    attr_reader :name, :capabilities

    def self.load
      [ Chrome.new,
        Firefox.new,
        InternetExplorer.new,
        Safari.new ].find { |browser| browser.match? }
    end

    def match?
      name == ENV['BROWSER']
    end

  end
end
