require_relative '../lib/selenium-launcher'

describe 'Selenium Launcher', :acceptance do

  it 'runs' do
    ENV['SL_BROWSER'] = 'firefox'
    driver = SeleniumLauncher.launch
    expect(driver.class).to eql Selenium::WebDriver::Driver
    expect(driver.browser).to eql :firefox
    driver.quit
  end

  context '-> Config Checker -> ' do

    before(:each) do
      ENV['SL_BROWSER'] = nil
      ENV['SL_HOST'] = nil
      ENV['SL_HOST_URL'] = nil
    end

    it 'no browser' do
      expect { driver = SeleniumLauncher.launch }.to raise_error(
        RuntimeError,
        'You need to specify a browser (e.g., SL_BROWSER).')
    end

    it 'no Grid host URL' do
      ENV['SL_BROWSER'] = 'firefox'
      ENV['SL_HOST'] = 'grid'
      expect { driver = SeleniumLauncher.launch }.to raise_error(
        RuntimeError,
        'You need to specify a URL when using a Grid (e.g., SL_HOST_URL).')
    end

  end

end
