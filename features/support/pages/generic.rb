class GenericPage
  include RSpec::Matchers
  attr_accessor :browser

  def initialize(browser)
    @browser = browser
  end

  # Expects a watir hash like {:id => "abc"}
  def element_exists?(el)
    @browser.element(el).exists?
  end

  def title
    @browser.title
  end

  def link
    @browser.link
  end

  def logout
    wait_until_loaded
    @browser.div(id: "team_menu").click
    @browser.li(id: "logout").click
    @browser.h1.wait_until_present
  end

  def error?
    @browser.p(class: "alert alert_error").exists?
  end

  def wait_until_loaded
    @browser.div(id:"loading-zone").wait_while_present
  end 

  def enter
    @browser.send_keys "\n"
  end
end
