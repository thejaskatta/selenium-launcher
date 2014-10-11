= selenium-launcher

== DESCRIPTION:

selenium-launcher provides a simple way to configure Selenium and launch a browser.

Currently supported approachs include:
1. Local browser execution with browser drivers (for easier test authoring)
2. Remote execution (for a single node or a grid)

== CONSIDERATIONS:

+ Will need to sort out the best way to handle browser driver downloads and configuration per OS. Will start by letting the user do the work and automate it later (in a separate gem).
+ Cloud execution will need to be added later, but that has additional considerations. So that will be deferred for now.
+ Mobile is also a consideration. Again, one to defer for now.

== USAGE:

=== Environment Variables

Configuration occurs through a small set of environment variables:

SL_HOST (e.g., 'grid', or nothing)
SL_HOST_URL (e.g., URL to Standalone Remote or Grid instance)
SL_BROWSER (e.g., 'chrome', 'firefox', 'internet-explorer', 'safari')

If these values are not set properly, a RuntimeError will be returned along with a helpful message.


selenium-launcher will return a Selenium WebDriver object.

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

== LICENSE:

The MIT License (MIT)

Copyright (c) 2014 Dave Haeffner

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
