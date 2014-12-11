require_relative 'spec_helper'
require_relative '../lib/selenium-launcher/launcher'

describe 'Launcher', :integration do

  context '-> Localhost -> ' do

    after(:each) do
      @launcher.quit
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
