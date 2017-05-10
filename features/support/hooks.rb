# # Use the headless gem if we've set the HEADLESS var to true
# # Set up browser
browser = Watir::Browser.new :chrome
 $setup_done = false

Before do
  @browser = browser
  @browser.cookies.clear

  unless $setup_done
    $setup_done = true
    # This stuff will only run before the first scenario executed. Use it to set up data etc.
  end
end

After do |scenario|
  @browser.driver.manage.delete_all_cookies
end 

  # Output a screenshot (and video if HEADLESS) if the scenario failed