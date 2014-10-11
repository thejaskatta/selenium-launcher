= Selenium Launcher

== Punch List:

1. Local browser execution with browser drivers (for easier test authoring)
2. Remote execution (for a single node or a grid)

== Considerations:

+ HTML and XML output are ripe candidates for their own gem, so they will not live here.
+ Will need to sort out the best way to handle browser driver downloads and configuration per OS. Will start by letting the user do the work and automate it later (in a separate gem).
+ Cloud execution will need to be added later, but that has additional considerations. So that will be deferred for now.
+ Mobile is also a consideration. Again, one to defer for now.

== Environment Variables

SL_HOST (e.g., 'grid', or nothing)
SL_HOST_URL (e.g., URL to Standalone Remote or Grid instance)
SL_BROWSER (e.g., 'chrome', 'firefox', 'internet-explorer', 'safari')

If these values are not set, a RuntimeError will be returned along with a helpful message.

== Getting Started

Selenium Launcher will return a Selenium WebDriver object.

=== Local

ENV['SL_BROWSER'] = 'firefox'
driver = SeleniumLauncher.launch
driver.quit

=== Grid

ENV['SL_BROWSER'] = 'firefox'
ENV['SL_HOST'] = 'grid'
ENV['SL_HOST_URL'] = 'http://localhost:4444/wd/hub'
driver = SeleniumLauncher.launch
driver.quit
