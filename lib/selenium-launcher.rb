require_relative 'selenium-launcher/launcher'

module SeleniumLauncher

  def self.launch
    ConfigChecker.new
    SeleniumLauncher::Launcher.new.driver
  end

  class ConfigChecker

    def initialize
      browser_check
      grid_check
    end

    private

      ERRORS = { NoBrowserSpecified: 'You need to specify a browser (e.g., SE_BROWSER).',
                 NoGridURLSpecified: 'You need to specify a URL when using a Grid (e.g., SE_HOST_URL).' }

      def browser_check
        if ENV['SE_BROWSER'].nil?
          raise ERRORS[:NoBrowserSpecified]
        end
      end

      def grid_check
        if ENV['SE_HOST'] == 'grid'
          if ENV['SE_HOST_URL'].nil?
            raise ERRORS[:NoGridURLSpecified]
          end
        end
      end

  end
end
