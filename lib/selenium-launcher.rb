require_relative 'selenium-launcher/launcher'

class SeleniumLauncher

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

      ERRORS = { NoBrowserSpecified: 'You need to specify a browser (e.g., SC_BROWSER).',
                 NoGridURLSpecified: 'You need to specify a URL when using a Grid (e.g., SC_HOST_URL).' }

      def browser_check
        if ENV['SC_BROWSER'].nil?
          raise ERRORS[:NoBrowserSpecified]
        end
      end

      def grid_check
        if ENV['SC_HOST'] == 'grid'
          if ENV['SC_HOST_URL'].nil?
            raise ERRORS[:NoGridURLSpecified]
          end
        end
      end

  end
end
