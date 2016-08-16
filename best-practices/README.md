Best Practices
==============

A guide for programming well.

General
-------

* Don't duplicate the functionality of a built-in library.
* Don't swallow exceptions or "fail silently."
* Don't write code that guesses at future functionality.
* [Exceptions should be exceptional](http://www.readability.com/~/yichhgvu).
* [Keep the code simple](http://www.readability.com/~/ko2aqda2).
* Avoid premature optimizations. Get a version 1.0 out there as soon as you
  can. Until you have some users to measure, you're optimizing based on guesses.
* Use `bin/setup` for initial setup of the project and for development
  environment seed data. After running this script in a clean environment you
  should be able to run the tests and those should pass.
* Use `bin/server` for starting all the processes required to run the project
  in a development environment, when suitable.
* Use `bin/deploy` for deploying the project to staging and production
  environments, when suitable.

Object-Oriented Design
----------------------

* Avoid global variables.
* Avoid long parameter lists (no more than 4).
* Limit collaborators of an object (entities an object depends on).
* Limit an object's dependencies (entities that depend on an object).
* Prefer composition over inheritance.
* Prefer small methods (between one and five lines).
* Prefer small objects with a single, well-defined responsibility (no more than
  100 lines).
* [Tell, don't ask](http://goo.gl/Ztawt).

Ruby
----

* Avoid optional parameters. Does the method do too much?
* Avoid monkey-patching.
* Prefer classes to modules when designing functionality that is shared by
  multiple models.
* Prefer `private` when indicating scope. Use `protected` only with comparison
  methods like `def ==(other)`, `def <(other)`, and `def >(other)`.

Ruby Gems
---------

* Declare dependencies in the `<PROJECT_NAME>.gemspec` file.
* Reference the `gemspec` in the `Gemfile`.
* Use [Bundler](http://bundler.io) to manage the gem's dependencies.
* Use [Travis CI](http://travis-ci.org) for Continuous Integration, indicators showing whether GitHub
  pull requests can be merged, and to test against multiple Ruby versions.

Rails
-----

* Avoid bypassing validations with methods like `save(validate: false)`,
  `update_attribute`, and `toggle`.
* Avoid naming methods after database columns in the same class.
* Don't change a migration after it has been merged into master if the desired
  change can be solved with another migration.
* Don't reference a model class directly from a view.
* Don't use instance variables in partials. Pass local variables to partials
  from view templates.
* Don't use SQL or SQL fragments (`where('inviter_id IS NOT NULL')`) outside of
  models.
* If there are default values, set them in migrations.
* Keep `db/schema.rb` under version control.
* Use only one instance variable in each view.
* Use SQL, not `ActiveRecord` models, in migrations.
* Use the [`.ruby-version`](https://gist.github.com/fnichol/1912050) file
  convention to specify the Ruby version and patch level for a project.
* Use `_url` suffixes for named routes in mailer views and
  [redirects](http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.30).
  Use `_path` suffixes for named routes everywhere else.
* Validate the associated `belongs_to` object (`user`), not the database column
  (`user_id`).

Testing
-------

* Avoid `any_instance` in rspec-mocks and mocha. Prefer [dependency injection].
* Avoid `its`, `let`, `let!`, `specify`, `before`, and `subject` in RSpec.
* Avoid using instance variables in tests.
* Disable real HTTP requests to external services with
  `WebMock.disable_net_connect!`.
* Don't test private methods.
* Test background jobs with a [`Delayed::Job` matcher] (or correspondent for
Resque, Sidekiq, etc...)
* Use [stubs and spies] (not mocks) in isolated tests.
* Use a single level of abstraction within scenarios.
* Use an `it` example or test method for each execution path through the method.
* Use [assertions about state] for incoming messages.
* Use stubs and spies to assert you sent outgoing messages.
* Use a [Fake] to stub requests to external services.
* Use integration tests to execute the entire app.
* Use non-[SUT] methods in expectations when possible.

[dependency injection]: http://en.wikipedia.org/wiki/Dependency_injection
[`Delayed::Job` matcher]: https://gist.github.com/3186463
[stubs and spies]: http://robots.thoughtbot.com/post/159805295/spy-vs-spy
[assertions about state]: https://speakerdeck.com/skmetz/magic-tricks-of-testing-railsconf?slide=51
[Fake]: http://robots.thoughtbot.com/post/219216005/fake-it
[SUT]: http://xunitpatterns.com/SUT.html

Bundler
-------

* Use a [pessimistic version] in the `Gemfile` for gems that follow semantic
  versioning, such as `rspec`, `factory_girl`, and `capybara`.
* Use a [versionless] `Gemfile` declarations for gems that are safe to update
  often, such as pg, thin, and debugger.
* Use an [exact version] in the `Gemfile` for fragile gems, such as Rails.
* Use `require: false`, whenever possible. Manually require the gem's files
  only where it is used

[Ruby version]: http://bundler.io/v1.3/gemfile_ruby.html
[exact version]: http://robots.thoughtbot.com/post/35717411108/a-healthy-bundle
[pessimistic version]: http://robots.thoughtbot.com/post/35717411108/a-healthy-bundle
[versionless]: http://robots.thoughtbot.com/post/35717411108/a-healthy-bundle

Postgres
--------

* Avoid multicolumn indexes in Postgres. It [combines multiple indexes]
  efficiently. Optimize later with a [compound index] if needed.
* Consider a [partial index] for queries on booleans.
* Constrain most columns as [`NOT NULL`].
* [Index foreign keys].

[`NOT NULL`]: http://www.postgresql.org/docs/9.1/static/ddl-constraints.html#AEN2444
[combines multiple indexes]: http://www.postgresql.org/docs/9.1/static/indexes-bitmap-scans.html
[compound index]: http://www.postgresql.org/docs/9.2/static/indexes-bitmap-scans.html
[partial index]: http://www.postgresql.org/docs/9.1/static/indexes-partial.html
[Index foreign keys]: https://tomafro.net/2009/08/using-indexes-in-rails-index-your-associations

Background Jobs
---------------

* Store IDs, not `ActiveRecord` objects for cleaner serialization, then re-find
  the `ActiveRecord` object in the `perform` method.

Email
-----

* Use a tool like [LetterOpener](https://github.com/ryanb/letter_opener) to look at each created or updated mailer view
  before merging.

JavaScript
----------

* Use CoffeeScript.

HTML
----

* Don't use a reset button for forms.
* Prefer cancel links to cancel buttons.

CSS
---

* Use Sass.

Sass
----

* Use `image-url` and `font-url`, not `url`, so the asset pipeline will re-write
  the correct paths to assets.

Browsers
--------

* Don't support clients without Javascript.
* Don't support IE8 or below.

Shell
-----
* Don't parse the output of `ls`. See [here][parsingls] for details and
  alternatives.
* Don't use `cat` to provide a file on `stdin` to a process that accepts
  file arguments itself.
* Prefer a `/bin/sh` [shebang][].
* Don't use any non-POSIX [features][bashisms] when using a `/bin/sh`
  [shebang][].
* If calling `cd`, have code to handle a failure to change directories.
* If calling `rm` with a variable, ensure the variable is not empty.
* Prefer "$@" over "$\*" unless you know exactly what you're doing.
* Prefer `awk '/re/ { ... }'` to `grep re | awk '{ ... }'`.
* Prefer `find -exec {} +` to `find -print0 | xargs -0`.
* Prefer `for` loops over `while read` loops.
* Prefer `grep -c` to `grep | wc -l`.
* Prefer `mktemp` over using `$$` to "uniquely" name a temporary file.
* Prefer `printf` over `echo`.
* Prefer `sed '/re/!d; s//.../'` to `grep re | sed 's/re/.../'`.
* Prefer `sed 'cmd; cmd'` to `sed -e 'cmd' -e 'cmd'`.
* Prefer checking exit statuses over output in `if` statements (`if grep
  -q ...; `, not `if [ -n "$(grep ...)" ];`).
* Prefer reading environment variables over process output (`$TTY` not
  `$(tty)`, `$PWD` not `$(pwd)`, etc).
* Use `$( ... )`, not backticks for capturing command output.
* Use `$(( ... ))`, not `expr` for executing arithmetic expressions.
* Use `1` and `0`, not `true` and `false` to represent boolean
  variables.
* Use `find -print0 | xargs -0`, not `find | xargs`.
* Use quotes around every `"$variable"` and `"$( ... )"` expression
  unless you want them to be word-split and/or interpreted as globs.
* Use the `local` keyword with function-scoped variables.
* Identify common problems with [shellcheck][].

[shebang]: http://en.wikipedia.org/wiki/Shebang_(Unix)
[parsingls]: http://mywiki.wooledge.org/ParsingLs
[bashisms]: http://mywiki.wooledge.org/Bashism
[shellcheck]: http://www.shellcheck.net/

Bash
----

In addition to Shell best practices,

* Prefer `${var,,}` and `${var^^}` over `tr` for changing case.
* Prefer `${var//from/to}` over `sed` for simple string replacements.
* Prefer `[[` over `test` or `[`.
* Prefer process substitution over a pipe in `while read` loops.
* Use `((` or `let`, not `$((` when you don't need the result
