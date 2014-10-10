class SeleniumConnect
  class Browser
    class Firefox < Browser

      def name
        'firefox'
      end

      def capabilities
        profile = Selenium::WebDriver::Firefox::Profile.new
        profile.assume_untrusted_certificate_issuer = false
      end

    end
  end
end
