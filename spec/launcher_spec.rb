require_relative 'spec_helper'
require_relative '../lib/selenium-launcher/launcher'

describe 'Launcher', :integration do

  after(:each) do
    @launcher.quit
  end

  context '-> Localhost -> ' do

    it 'Chrome' do
      ENV['SL_BROWSER'] = 'chrome'
      @launcher = SeleniumLauncher::Launcher.new
      expect(@launcher.driver.class).to eql Selenium::WebDriver::Driver
      expect(@launcher.driver.browser).to eql :chrome
    end

    it 'Firefox' do
      ENV['SL_BROWSER'] = 'firefox'
      @launcher = SeleniumLauncher::Launcher.new
      expect(@launcher.driver.class).to eql Selenium::WebDriver::Driver
      expect(@launcher.driver.browser).to eql :firefox
    end

    it 'Internet Explorer' do
      pending 'Windows OS required' unless OS.windows?
      ENV['SL_BROWSER'] = 'internet-explorer'
      @launcher = SeleniumLauncher::Launcher.new
      expect(@launcher.driver.class).to eql Selenium::WebDriver::Driver
      expect(@launcher.driver.browser).to eql :"internet-explorer"
    end

    it 'Safari' do
      ENV['SL_BROWSER'] = 'safari'
      @launcher = SeleniumLauncher::Launcher.new
      expect(@launcher.driver.class).to eql Selenium::WebDriver::Driver
      expect(@launcher.driver.browser).to eql :safari
    end

  end

  context '-> Grid -> ' do

    before(:all) do
      ENV['SL_HOST'] = 'grid'
      ENV['SL_HOST_URL'] = 'http://localhost:4444/wd/hub'
    end

    it 'Chrome' do
      ENV['SL_BROWSER'] = 'chrome'
      @launcher = SeleniumLauncher::Launcher.new
      expect(@launcher.driver.class).to eql Selenium::WebDriver::Driver
      expect(@launcher.driver.browser).to eql :chrome
    end

    it 'Firefox' do
      ENV['SL_BROWSER'] = 'firefox'
      @launcher = SeleniumLauncher::Launcher.new
      expect(@launcher.driver.class).to eql Selenium::WebDriver::Driver
      expect(@launcher.driver.browser).to eql :firefox
    end

    it 'Internet Explorer' do
      pending 'Windows OS required' unless OS.windows?
      ENV['SL_BROWSER'] = 'internet-explorer'
      @launcher = SeleniumLauncher::Launcher.new
      expect(@launcher.driver.class).to eql Selenium::WebDriver::Driver
      expect(@launcher.driver.browser).to eql :"internet-explorer"
    end

    it 'Safari' do
      ENV['SL_BROWSER'] = 'safari'
      @launcher = SeleniumLauncher::Launcher.new
      expect(@launcher.driver.class).to eql Selenium::WebDriver::Driver
      expect(@launcher.driver.browser).to eql :safari
    end

  end
end
