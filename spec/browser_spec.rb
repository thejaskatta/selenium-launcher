require_relative '../lib/selenium-launcher/browser'

describe 'Browser returns', :unit do

  it 'Chrome' do
    ENV['SE_BROWSER'] = 'chrome'
    browser = SeleniumLauncher::Browser.load
    expect(browser.class).to eql SeleniumLauncher::Browser::Chrome
  end

  it 'Firefox' do
    ENV['SE_BROWSER'] = 'firefox'
    browser = SeleniumLauncher::Browser.load
    expect(browser.class).to eql SeleniumLauncher::Browser::Firefox
  end

  it 'Internet Explorer' do
    ENV['SE_BROWSER'] = 'internet-explorer'
    browser = SeleniumLauncher::Browser.load
    expect(browser.class).to eql SeleniumLauncher::Browser::InternetExplorer
  end

  it 'Safari' do
    ENV['SE_BROWSER'] = 'safari'
    browser = SeleniumLauncher::Browser.load
    expect(browser.class).to eql SeleniumLauncher::Browser::Safari
  end

end
