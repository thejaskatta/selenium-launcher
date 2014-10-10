require_relative '../lib/selenium-connect/browser'

describe 'Browser returns', unit: true do

  it 'Chrome' do
    ENV['SC_BROWSER'] = 'chrome'
    browser = SeleniumConnect::Browser.load
    expect(browser.class).to eql SeleniumConnect::Browser::Chrome
  end

  it 'Firefox' do
    ENV['SC_BROWSER'] = 'firefox'
    browser = SeleniumConnect::Browser.load
    expect(browser.class).to eql SeleniumConnect::Browser::Firefox
  end

  it 'Internet Explorer' do
    ENV['SC_BROWSER'] = 'internet-explorer'
    browser = SeleniumConnect::Browser.load
    expect(browser.class).to eql SeleniumConnect::Browser::InternetExplorer
  end

  it 'Safari' do
    ENV['SC_BROWSER'] = 'safari'
    browser = SeleniumConnect::Browser.load
    expect(browser.class).to eql SeleniumConnect::Browser::Safari
  end

end
