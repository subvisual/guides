ESLint Setup
============

1. Copy [.eslintrc](.eslintrc) to the root of the project.
2. Install `eslint-config-airbnb`.


    npm i --save-dev eslint-config-airbnb


3. Install its peer dependencies following the [instructions in the repo](https://www.npmjs.com/package/eslint-config-airbnb)


Overrides
---------

Airbnb's configuration is great, but some of their rules are too strict for our
team. The following are the rules that we decided not to follow:

1. `consistent-return`

This rule requires that return statements either always or never specify values.
See the following invalid example:

```
const fun = (props) => {
  if (!props.value) return;
  return props.value * 2;
};
```

To make it valid, we would have to write something like this:

```
const fun = (props) => {
  if (!props.value) return undefined;
  return props.value * 2;
};
```

2. `react/no-multi-comp`

This rule prevents multiple component definition per file. This is a good
thing, but, for stateless components, it's a strict and painful rule to
follow.
