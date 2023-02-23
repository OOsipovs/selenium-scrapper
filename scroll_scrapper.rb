require 'selenium-webdriver'

options = Selenium::WebDriver::Chrome::Options.new
options.headless!

driver = Selenium::WebDriver.for(:chrome, capabilities:[options])
driver.get "https://metaruby.com/"

item_names_selector = "a.title_raw-link.raw-topic-link"

current_total = driver.find_elements(css: item_names_selector).size

loop do
    driver.execute_script("window.scrollBy(0, 10000)")
    sleep(2)
    new_total = driver.find_elements(css: item_names_selector).size
    if new_total == current_total
        puts "> Scrolling is done"
        break
    else
        current_total = new_total
        puts "> #{current_total} items loaded so far"
    end
end

count = 0
driver.find_elements(css: item_names_selector).each do |element|
    name = element.text

    puts '------------'
    puts "#{count += 1} - #{name}"
end

driver.quit
