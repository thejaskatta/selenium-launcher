require_relative '../lib/selenium-launcher'

module OS
  def OS.windows?
    (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
  end

  def OS.mac?
   (/darwin/ =~ RUBY_PLATFORM) != nil
  end

  def OS.unix?
    !OS.windows?
  end

  def OS.linux?
    OS.unix? and not OS.mac?
  end
end

include OS

RSpec.configure do |config|
  config.before(:all) do
    Selenium::WebDriver::Chrome::Service.executable_path = File.join(Dir.pwd, 'spec/vendor/chromedriver')
  end
end
