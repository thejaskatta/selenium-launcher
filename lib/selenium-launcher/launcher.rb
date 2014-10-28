require_relative 'browser'
require 'selenium-webdriver'

module SeleniumLauncher
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
        case ENV['SE_HOST']
        when 'remote'
          ::Selenium::WebDriver.for(
            :remote,
            url: ENV['SE_HOST_URL'],
            desired_capabilities: browser.capabilities)
        else
          ::Selenium::WebDriver.for browser.name.to_sym
        end
      end

  end
end
