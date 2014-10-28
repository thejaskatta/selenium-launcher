require_relative '../lib/selenium-launcher/browser'

describe 'Browser returns', :unit do

  def browser
    SeleniumLauncher::Browser.load
  end

  it 'Chrome' do
    ENV['SE_BROWSER'] = 'chrome'
    expect(browser.class).to eql SeleniumLauncher::Browser::Chrome
  end

  it 'Firefox' do
    ENV['SE_BROWSER'] = 'firefox'
    expect(browser.class).to eql SeleniumLauncher::Browser::Firefox
  end

  it 'Internet Explorer' do
    ENV['SE_BROWSER'] = 'internet_explorer'
    expect(browser.class).to eql SeleniumLauncher::Browser::InternetExplorer
  end

  it 'Safari' do
    ENV['SE_BROWSER'] = 'safari'
    expect(browser.class).to eql SeleniumLauncher::Browser::Safari
  end

end
