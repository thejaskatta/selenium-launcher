require 'browsers/chrome'
require 'browsers/firefox'
require 'browsers/internet-explorer'
require 'browsers/safari'

class SeleniumConnect
  class Browsers
    def initialize
      [ Chrome.new,
        Firefox.new,
        InternetExplorer.new,
        Safari.new ]
    end
  end
end
