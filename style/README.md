Style
=====

A guide for programming in style.

In addition to the general guidelines below, we have the following more detailed, language/framework specific style guides:

* [JS](js)
* [Ruby](ruby)
* [Sass](sass)
* [Templating](templating)

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
