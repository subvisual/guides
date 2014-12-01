Style
=====

A guide for programming in style.

Git
---

* Avoid including files in source control that are specific to your
  development machine or process.
* Follow the [protocol](/protocol)

Formatting
----------

* Avoid comments.
* Delete trailing whitespace.
* Don't include spaces after `(`, `[` or before `]`, `)`.
* Don't misspell.
* Don't vertically align tokens on consecutive lines.
* If you break up a hash, keep the elements and closing curly brace on their own lines.
* Indent continued lines two spaces.
* Indent private methods equal to public methods.
* Use 2 space indentation (no tabs).
* Use an empty line between methods and other changes of concept (validations, filters, ...).
* Use spaces around operators, after commas, after colons and semicolons, around
  `{` and before `}`.
* Use [Unix-style line endings](http://unix.stackexchange.com/questions/23903/should-i-end-my-text-script-files-with-a-newline) (`\n`).
* Use [uppercase for SQL key words and lowercase for SQL identifiers](http://www.postgresql.org/docs/9.2/static/sql-syntax-lexical.html#SQL-SYNTAX-IDENTIFIERS).

Naming
------

* Avoid abbreviations.
* Avoid types in names (`user_array`).
* Name the enumeration parameter the singular of the collection.
* Name variables, methods, and classes to reveal intent.
* Treat acronyms as words in names (`XmlHttpRequest` not `XMLHTTPRequest`),
  even if the acronym is the entire name (`class Html` not `class HTML`).
* Spend time thinking on the name of things so that you don't spend afterwards
  trying to decifer your own code.

Sass
----
### Formatting
* Use the SASS syntax.
* Use hyphens when naming mixins, extends, classes & variables: `span-columns` not `span_columns` or `spanColumns`.
* Use space between property and value: `width: 20px` not `width:20px`.
* Use a blank line above selector that has styles.
* Prefer hex color codes `#000`.
* Use `//` for comment blocks not `/* */`.
* Use single or double quotes consistently. Preference is for double quotes, e.g., `content: ""`.
* Use only lowercase, including colors.
* Don't add a unit specification after `0` values, unless required by a mixin.

### Order
* Place scoped variables, @extends and @includes (excluding media query stuff) at the top of your declaration list, in that order.
* Use alphabetical order for declarations.
* Place media queries directly after the declaration list.
* Place concatenated selectors second.
* Place pseudo states and elements third.
* Place nested selectors last.

### Selectors
* Don't use ID's for style.
* Use meaningful names: `$visual-grid-color` not `$color` or `$vslgrd-clr`.
* Use ID and class names that are as short as possible but as long as necessary.
* Use one selector per line.
* If :hover pseudo class is styled, :focus should also be styled for accessibility. Focus styles should never be removed.
* Avoid using the direct descendant selector `>`.
* Avoid nesting more than 3 selectors deep.
* Don't nest more than 6 selectors deep.
* Avoid using the HTML tag in the class name: `/*section*/.news` not `/*section*/.news-section`.
* Avoid using HTML tags on classes with specific class names like `.featured-articles`.
* Don't qualify selectors: `.widgets` not `div.widgets`.
* Avoid nesting within a media query.

### Organization
* Use Compass or Bourbon for a Sass library.
* Use Normalize as a browser reset.
* Use HTML structure for ordering of selectors. Don't just put styles at the
  bottom of the Sass file.
* Avoid having files longer than 100 lines.

CoffeeScript
------------

* Initialize arrays using `[]`.
* Initialize empty objects and hashes using `{}`.
* Use `CamelCase` for classes, `lowerCamelCase` for variables and functions,
  `SCREAMING_SNAKE_CASE` for constants, `_single_leading_underscore` for
  private variables and functions.
* Prefer `== ` or `===` to `is`.
* Prefer `||` and `&&` to `or` and `and`.

Ruby
----

[Sample](/groupbuddies/guides/blob/master/style/samples/ruby.rb)

* Avoid conditional modifiers (lines that end with conditionals).
* Avoid multiple assignments per line (`one, two = 1, 2`).
* Avoid organizational comments (`# Validations`).
* Avoid ternary operators (`boolean ? true : false`). Use multi-line `if`
  instead to emphasize code branches.
* Avoid explicit return statements.
* Avoid using semicolons.
* Avoid assignments on conditionals.
* Prefer `detect` over `find`.
* Prefer `inject` over `reduce`.
* Prefer `map` over `collect`.
* Prefer `select` over `find_all`.
* Prefer single quotes for strings.
* Use `do...end` for multi line blocks and `{...}` for one line blocks.
* Use `_` for unused block parameters.
* Use `%{}` for single-line strings needing interpolation and double-quotes.
* Use `&&` and `||` for Boolean expressions.
* Use `?` suffix for predicate methods.
* Use `CamelCase` for classes and modules, `snake_case` for variables and
  methods, `SCREAMING_SNAKE_CASE` for constants.
* Use `def self.method`, not `def Class.method` or `class << self`.
* Use `def` with parentheses when there are arguments.
* Use `each`, not `for`, for iteration.
* Use heredocs for multi-line strings.
* Use `%w()` and `%i()` for hard-coded lists of strings and symbols.

ERb
---

* Use Slim

Slim
----
[Sample](/groupbuddies/guides/blob/master/style/samples/slim.rb)

* When wrapping long lines, keep the method name on the same line as the Slim
  interpolation operator and keep each method argument on its own line.
* Prefer double quotes for attributes.

HTML
----

* Prefer double quotes for attributes.

Rails
-----

* Avoid `member` and `collection` routes.
* Use private instead of protected when defining controller methods.
* Name date columns with `_on` suffixes.
* Name datetime columns with `_at` suffixes.
* Name initializers for their gem name.
* Order ActiveRecord associations alphabetically by attribute name.
* Order ActiveRecord validations alphabetically by attribute name.
* Order controller contents: filters, public methods, private methods.
* Order model contents: constants, macros, public methods, private methods.
* Put application-wide partials in the [`app/views/application`] directory.
* Use `def self.method`, not the `scope :method` DSL.
* Use the default `render 'partial'` syntax over `render partial: 'partial'`.

[`app/views/application`]: http://asciicasts.com/episodes/269-template-inheritance

Rails Routes
------------

* Avoid the `:except` option in routes.
* Order resourceful routes alphabetically by name.
* Use the `:only` option to explicitly state exposed routes.

Background Jobs
---------------

* Define a `PRIORITY` constant at the top of delayed job classes.
* Define two public methods: `self.enqueue` and `perform`.
* Put delayed job classes in `app/jobs`.

Email
-----

* Use one `ActionMailer` for the app. Name it `Mailer`.
* Use the user's name in the `From` header and email in the `Reply-To` when
  [delivering email on behalf of the app's users].

[delivering email on behalf of the app's users]: http://robots.thoughtbot.com/post/3215611590/recipe-delivering-email-on-behalf-of-users

Testing
-------

[Sample](/groupbuddies/guides/blob/master/style/samples/testing.rb)

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

[Sample](samples/acceptance_test.rb)

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
