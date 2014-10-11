require_relative '../lib/selenium-launcher'

describe 'Selenium Launcher', :acceptance do

  it 'runs' do
    ENV['SC_BROWSER'] = 'firefox'
    driver = SeleniumLauncher.launch
    expect(driver.class).to eql Selenium::WebDriver::Driver
    expect(driver.browser).to eql :firefox
    driver.quit
  end

  context '-> Config Checker -> ' do

    before(:each) do
      ENV['SC_BROWSER'] = nil
      ENV['SC_HOST'] = nil
      ENV['SC_HOST_URL'] = nil
    end

    it 'no browser' do
      expect { driver = SeleniumLauncher.launch }.to raise_error(
        RuntimeError,
        'You need to specify a browser (e.g., SC_BROWSER).')
    end

    it 'no Grid host URL' do
      ENV['SC_BROWSER'] = 'firefox'
      ENV['SC_HOST'] = 'grid'
      expect { driver = SeleniumLauncher.launch }.to raise_error(
        RuntimeError,
        'You need to specify a URL when using a Grid (e.g., SC_HOST_URL).')
    end

  end

end
