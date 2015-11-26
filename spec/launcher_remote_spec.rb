require_relative 'spec_helper'
require 'typhoeus'

describe 'Launcher', :integration do

  def selenium_server_up?
    Typhoeus.get(ENV['SE_HOST_URL'] + '/status').code == 200
  end

  before(:all) do
    ENV['SE_HOST']      = 'remote'
    ENV['SE_HOST_URL']  = 'http://localhost:4444/wd/hub'
    @process_id = Process.spawn(
      'java -jar spec/vendor/selenium-server-standalone-2.48.2.jar -Dwebdriver.chrome.driver=spec/vendor/chromedriver')
    until selenium_server_up? do
      sleep 2
    end
  end

  after(:all) do
    Process.kill("KILL", @process_id)
  end

  context '-> Remote -> ' do

    after(:each) do
      @launcher.driver.quit
    end

    it 'Chrome' do
      ENV['SE_BROWSER'] = 'chrome'
      @launcher = SeleniumLauncher::Launcher.new
      expect(@launcher.driver.class).to eql Selenium::WebDriver::Driver
      expect(@launcher.driver.browser).to eql :chrome
    end

    it 'Firefox' do
      ENV['SE_BROWSER'] = 'firefox'
      @launcher = SeleniumLauncher::Launcher.new
      expect(@launcher.driver.class).to eql Selenium::WebDriver::Driver
      expect(@launcher.driver.browser).to eql :firefox
    end

    it 'Internet Explorer' do
      skip 'Windows OS required' unless OS.windows?
      ENV['SE_BROWSER'] = 'internet_explorer'
      @launcher = SeleniumLauncher::Launcher.new
      expect(@launcher.driver.class).to eql Selenium::WebDriver::Driver
      expect(@launcher.driver.browser).to eql :internet_explorer
    end

    it 'Safari' do
      # See https://github.com/tourdedave/selenium-launcher/issues/3 if you experience Safari issues
      skip 'Safari on Windows is unsupported' if OS.windows?
      ENV['SE_BROWSER'] = 'safari'
      @launcher = SeleniumLauncher::Launcher.new
      expect(@launcher.driver.class).to eql Selenium::WebDriver::Driver
      expect(@launcher.driver.browser).to eql :safari
    end

  end
end
