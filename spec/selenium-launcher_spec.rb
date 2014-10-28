require_relative '../lib/selenium-launcher'

describe 'Selenium Launcher', :acceptance do

  it 'runs' do
    ENV['SE_HOST'] = nil
    ENV['SE_BROWSER'] = 'firefox'
    driver = SeleniumLauncher.launch
    expect(driver.class).to eql Selenium::WebDriver::Driver
    expect(driver.browser).to eql :firefox
    driver.quit
  end

  context '-> Config Checker -> ' do

    before(:each) do
      ENV['SE_BROWSER'] = nil
      ENV['SE_HOST'] = nil
      ENV['SE_HOST_URL'] = nil
    end

    it 'no browser' do
      expect { driver = SeleniumLauncher.launch }.to raise_error(
        RuntimeError,
        'You need to specify a browser (e.g., SE_BROWSER).')
    end

    it 'no remote host URL' do
      ENV['SE_BROWSER'] = 'firefox'
      ENV['SE_HOST'] = 'remote'
      expect { driver = SeleniumLauncher.launch }.to raise_error(
        RuntimeError,
        'You need to specify a URL when using a Remote node (e.g., SE_HOST_URL).')
    end

  end

end
