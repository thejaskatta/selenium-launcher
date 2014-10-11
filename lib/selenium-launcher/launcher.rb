require_relative 'browser'
require 'selenium-webdriver'

class SeleniumLauncher
  class Launcher

    attr_reader :browser, :driver

    def initialize
      @browser = SeleniumLauncher::Browser.load
      @driver = launch
    end

    def quit
      driver.quit
    end

    private

      def launch
        case ENV['SC_HOST']
        when 'grid'
          ::Selenium::WebDriver.for(
            :remote,
            url: ENV['SC_HOST_URL'],
            desired_capabilities: browser.capabilities)
        else
          ::Selenium::WebDriver.for browser.name.to_sym
        end
      end

  end
end
