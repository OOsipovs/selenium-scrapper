require 'selenium-webdriver'

options = Selenium::WebDriver::Chrome::Options.new
options.headless!

driver = Selenium::WebDriver.for(:chrome, capabilities:[options])
driver.get "https://github.com/search?q=ruby+web+scraping"

driver.find_elements(css: '.repo-list li').each do |element|
    name = element.find_element(css: 'a.v-align-middle').text
    description = element.find_element(css: 'p.mb-1').text.strip

    puts '------------'
    puts "#{name}"
    puts "#{description}"
end

driver.quit
