Testing guides
=====
[Sample](samples/testing.rb)

* Follow the [best practices](/best-practices#testing)
* Prefer factories to fixtures.
* Avoid the `private` keyword in specs.
* Prefer `eq` to `==` in RSpec.
* Separate setup, exercise, verification, and teardown phases with newlines.
* Use RSpec's [`expect` syntax](http://myronmars.to/n/dev-blog/2012/06/rspecs-new-expectation-syntax).
* Use `not_to` instead of `to_not` in RSpec expectations.
* Use an `it` example for each execution path through the method.
* Use shared contexts but include them explicitly with `include_context`

#### Acceptance Tests

* Avoid scenario titles that add no information, such as "successfully."
* Avoid scenario titles that repeat the feature title.
* Place helper methods for feature specs directly in a top-level `Features`
  module.
* Use Capybara's `feature/scenario` DSL.
* Use names like `ROLE_ACTION_spec.rb`, such as
  `user_changes_password_spec.rb`, for feature spec file names.
* Use only one `feature` block per feature spec file.
* Use scenario titles that describe the success and failure paths.
* Use spec/features directory to store feature specs.
* Use spec/support/features for support code related to feature specs.

#### Factories

* Order `factories.rb` contents: sequences, traits, factory definitions.
* Order factory attributes: implicit attributes, explicit attributes,
  child factory definitions. Each section's attributes are alphabetical.
* Order factory definitions alphabetically by factory name.
* Use one factories.rb file per project.

#### Unit Tests

[Sample](samples/testing.rb)

* Don't prefix `it` block descriptions with 'should'.
* Use `context` blocks for each method under test and name them accordingly. Use `.method`
  for class methods and `#method` for instance methods.
