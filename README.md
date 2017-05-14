# Rest Country Automated API Test Framework 


![Ruby Logo](http://vignette4.wikia.nocookie.net/battlefordreamisland/images/5/5e/Ruby_Icon.png/revision/latest/scale-to-width-down/50?cb=20170123035914) Ruby 

This document describes the Rest Country API test framework. The requirement for the framework was to create a BBD Feature file for the following use Case  :

"As a user I want to be able to see all countries in the world So that I can then choose which country to see further details about"

I was assigned to use the following API: https://restcountries.eu/rest/v1/all

 The following three instruction bellow were provided in order to complete the framework:

1. Determine what coverage you would look to achieve through feature tests and what other techniques you might like to use to test to obtain good test coverage.  

2. Implement the more important scenarios (min 2) creating a way of testing them that will allow for executing in an automated manner. This should demonstrate an understanding of the attributes that make up a good test framework, using the language/library of your choice Java, Ruby or C#.  

3. Annotate how you would trace the features back to the requirement. If time permits, include reporting that demonstrates how the features have been validated

##Extra

Since the deadline for this task was extended i decided once the requirments were met , to conduct further testing of the different endpoints of the  Rest countries Api. Bellow are the Different features that were tested in order to test all the endpoint that Version 1 of the Rest Countries API had to offer 

1. Calling Code : "As a user I want to be able to search for a  country using the calling code  So that I can then see further details about the country"

2. Capital City : "As a user I want to be able to search for a  country by the cpital city So that I can then see further details about the country "

3. Country Code : "As a user I want to be able to see all countries in the world Using the country Code So that I can then choose which country to see further details about"

4. Specific Country : "As a user I want to be able to search for a particular country  So that I can see further details about the country 
"

5. Currency : "As a user I want to be able to see all countries Associated with a particular Currency so that I can then choose which country to see further details about"

6. Region : "As a user I want to be able to see all countries in a particular Region So that I can then choose which country to see further details about"

## Installation

**Prerequisites**:

<!-- * Chromedriver -->
* Ruby v2.3.3

```
brew install chromedriver
```

### Features

In general, the acceptance tests are high-level.

````ruby
When I do some things
Then something should be checked
````

### Page Objects 

Page Objects are where you write the code required to run the tests. The methods within the page objects contain the logic code to actually carry out the tests

```
class Dashboard < GenericPage
  def site_admin
    @browser.text.include?("Site Admin")
  end

  def admin_panel
    @browser.p(:id, "expandable_branch_71_siteadministration").text
  end
  ...
end
```

Once made and checked to be working fine, then you should be able to call the actions within the step_definitions to execute the code

### Step Definitions

In general, the actual actions to be taken are described in the step definitions:

````ruby
When /^I do some things$/ do
  @app.home.set_something_up
  @app.home.do_another_thing
  @app.courses.do_something_else
end
````

### Fat & Skinny Step Definitions

Taking a leaf out of Rails' book, step definitions should be kept as 'skinny' as possible, delegating work to either models or page objects.

#Running the Test

 Once the Step Defintion's are complete then the test is ready to executed inorder to run test run the following command 

 ````shell
    bundle exec cucumber

````


## Contributors

| Username    | Name              | E-mail                   |
| --------------|-------------------|--------------------------|
| ks488       | Khalid Abdulkarim | kabdul@spartaglobal.co   |

