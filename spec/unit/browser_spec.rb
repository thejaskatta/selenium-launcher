require_relative '../../lib/selenium-connect/browser'

describe 'Browser returns' do

  it 'Chrome' do
    ENV['BROWSER'] = 'chrome'
    browser = SeleniumConnect::Browser.load
    expect(browser.class).to eql SeleniumConnect::Browser::Chrome
  end

  it 'Firefox' do
    ENV['BROWSER'] = 'firefox'
    browser = SeleniumConnect::Browser.load
    expect(browser.class).to eql SeleniumConnect::Browser::Firefox
  end

  it 'Internet Explorer' do
    ENV['BROWSER'] = 'internet-explorer'
    browser = SeleniumConnect::Browser.load
    expect(browser.class).to eql SeleniumConnect::Browser::InternetExplorer
  end

  it 'Safari' do
    ENV['BROWSER'] = 'safari'
    browser = SeleniumConnect::Browser.load
    expect(browser.class).to eql SeleniumConnect::Browser::Safari
  end

end
