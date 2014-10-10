require_relative '../lib/selenium-connect/launcher'

describe 'Launcher', integration: true do

  after(:each) do
    @launcher.quit
  end

  context '-> Localhost -> ' do

    it 'Chrome' do
      ENV['SC_BROWSER'] = 'chrome'
      @launcher = SeleniumConnect::Launcher.new
      expect(@launcher.driver.class).to eql Selenium::WebDriver::Driver
      expect(@launcher.driver.browser).to eql :chrome
    end

    it 'Firefox' do
      ENV['SC_BROWSER'] = 'firefox'
      @launcher = SeleniumConnect::Launcher.new
      expect(@launcher.driver.class).to eql Selenium::WebDriver::Driver
      expect(@launcher.driver.browser).to eql :firefox
    end

    it 'Internet Explorer' do
      pending 'Windows setup and OS pre-check required'
      ENV['SC_BROWSER'] = 'internet-explorer'
      @launcher = SeleniumConnect::Launcher.new
      expect(@launcher.driver.class).to eql Selenium::WebDriver::Driver
      expect(@launcher.driver.browser).to eql :"internet-explorer"
    end

    it 'Safari' do
      ENV['SC_BROWSER'] = 'safari'
      @launcher = SeleniumConnect::Launcher.new
      expect(@launcher.driver.class).to eql Selenium::WebDriver::Driver
      expect(@launcher.driver.browser).to eql :safari
    end

  end

  context '-> Grid -> ' do

    before(:all) do
      ENV['SC_HOST'] = 'grid'
      ENV['SC_HOST_URL'] = 'http://localhost:4444/wd/hub'
    end

    #it 'Firefox' do
    #  pending 'Latest version of Selenium Standalone Server'
    #  ENV['SC_BROWSER'] = 'firefox'
    #  @launcher = SeleniumConnect::Launcher.new
    #end

    it 'Chrome' do
      ENV['SC_BROWSER'] = 'chrome'
      @launcher = SeleniumConnect::Launcher.new
      expect(@launcher.driver.class).to eql Selenium::WebDriver::Driver
      expect(@launcher.driver.browser).to eql :chrome
    end

  end
end
