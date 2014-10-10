require_relative 'browser'
require 'selenium-webdriver'

class SeleniumConnect
  class Runner

    attr_reader :browser, :driver

    def initialize
      @browser = SeleniumConnect::Browser.load
      launch
    end

    def quit
      driver.quit
    end

    private

      def launch
        @driver = ::Selenium::WebDriver.for browser.name.to_sym,
          profile: browser.capabilities
      end

  end
end
