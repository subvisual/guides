JavaScript Style Guides
=====

Guides for programing JavaScript in style

General
---
* Use [ESLint](http://eslint.org/).
* Always use `use strict`.

Parens and Braces
---
* Leave one space between `if` and `(`.

```javascript
if (something) {
  //some work here;
}
```

* Prefer this form for multiline `if` statements.

```javascript
if (something) {
  // do stuff
  // even more stuff
} else {
  // some other stuff
  // real stuff
}
```

* Don't include spaces between `(` and function declaration.

```javascript
function bar() {
  return  foo;
}

var bar = function() {
  return foo;
}
```

Assignments and Declarations
---
* Initialize arrays with `[]`.

```javascript
var array = [];
```

* Initialize objects with `{}`.

```javascript
var object = {};
```

* Leave one space after `{` and before `}` when initializing objects on the same line.

```javascript
var map = { ready: 9, when: 4, "you are": 15 };
```

* Prefer single line object/array initialization.

```javascript
var object = { when: 4, ready: 9, "you are": 15 };

var array = [1, 2, 3];
```

Constructors
---

* Prefer this form for constructors.

```javascript
function Foo(bar) {
  this.bar = bar;
}

Foo.prototype.getBar = function() {
  return this.bar;
};

var foo = new Foo("bar");
```

Chaining
---

* When chaining methods indent one time.

```javascript
var elements = [$('.button'), $('.navbar')];

elements
  .addClass("foo")
  .children()
  .html()
  .end()
  .appendTo("body");
```

Callbacks
---

* Whenever possible make callbacks named functions, it makes the stack trace easier to understand.

```javascript
  function callback(error, result) {
    //some work here
  }

  bar(foo, callback);
```

Conditional evaluation
---

* Always use `===`.
* You can use `==` when checking for both null and undefined.

```javascript
 undefinedOrNull == null;
```

* When evaluating that an array or string is not empty, evaluate truthiness.

```javascript
if (array.length) {
  // array is not empty
} else {
  // array is empty
}

if (string) {
  // string is not empty
} else {
  // string is empty
}
```

* When evaluating that a reference is true, evaluate its truthiness.

```javascript
if (foo) {
  // foo is true
}
```

* When evaluating that a reference is false, use negation to coerce a true evaluation.

```javascript
if (!foo) {
  // foo is false
}
```

CoffeeScript
------------

* Initialize arrays using `[]`.
* Initialize empty objects and hashes using `{}`.
* Use `CamelCase` for classes, `lowerCamelCase` for variables and functions,
  `SCREAMING_SNAKE_CASE` for constants, `_single_leading_underscore` for
  private variables and functions.
* Prefer `== ` or `===` to `is`.
* Prefer `||` and `&&` to `or` and `and`.
