require_relative '../../lib/selenium-connect/runner'

describe 'Runner launches' do

  after(:each) do
    @runner.quit
  end

  it 'Chrome' do
    ENV['BROWSER'] = 'chrome'
    @runner = SeleniumConnect::Runner.new
    expect(@runner.driver.class).to eql Selenium::WebDriver::Driver
    expect(@runner.driver.browser).to eql :chrome
  end

  it 'Firefox' do
    ENV['BROWSER'] = 'firefox'
    @runner = SeleniumConnect::Runner.new
    expect(@runner.driver.class).to eql Selenium::WebDriver::Driver
    expect(@runner.driver.browser).to eql :firefox
  end

  it 'Internet Explorer' do
    pending 'Windows setup and OS pre-check required'
    ENV['BROWSER'] = 'internet-explorer'
    @runner = SeleniumConnect::Runner.new
    expect(@runner.driver.class).to eql Selenium::WebDriver::Driver
    expect(@runner.driver.browser).to eql :"internet-explorer"
  end

  it 'Safari' do
    ENV['BROWSER'] = 'safari'
    @runner = SeleniumConnect::Runner.new
    expect(@runner.driver.class).to eql Selenium::WebDriver::Driver
    expect(@runner.driver.browser).to eql :safari
  end

end
