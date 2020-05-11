[trello]: https://trello.com/whatever
[build-page]: https://semaphore.com/whatever
[production]: https://link.to.production/

PROJECT NAME
============

Put the build badges here.

* [Trello][trello]
* [Build Page][build-page]
* [Production][production]
* ...

Short project description. You can use the client's pitch. No more than ten lines.

**Table of Contents**

* [Installation](#installation)
* [Setup](#setup)
* [Development](#development)
* [Deployment](#deployment)
* [More Sections](#more-sections)
* [Contribution Guidelines](#contribution-guidelines)
* [Resources](#resources)
* [About](#about)

Installation
------------

A set of instruction to include and install the project as a dependency of
another.

This is only valid if you are creating a hex package or a library.
As an example:

First, you need to add PROJECT_NAME to your list of dependencies on `mix.exs`:

```elixir
def deps do
  [{:PROJECT_NAME, github: "subvisual/PROJECT_NAME"}]
end
```
If you are using Elixir pre-1.4.0, don't forget to ensure PROJECT_NAME is
started before your application.

```elixir
def applications do
  [application: [:PROJECT_NAME]]
end
```

You may need to install the dependencies defined on the [setup](#setup) section.

Setup
-----

A set of instructions to setup the project. It can start with a list of dependencies, like databases, and finish with the instructions, or it can be a simple list of commands. For instance:

First, clone & setup the repository:

```
git clone git@github.com:subvisual/PROJECT_NAME.git
cd PROJECT_NAME
bin/setup
```

After that, open the `.env` file in your editor and fill in the required secret values.

Development
-----------

A set of instructions to run the project in development. For instance:

To start your development environment run:

```
bin/server
```

This will start the node application, Redis, and Gulp.
ProjectName uses Gulp to watch and compile frontend assets.
To build the assets only once, not watching for changes, run:

```
npm run build
```

Deployment
----------

Deploys can be manual or automatic. In both cases, write a short explanation about how it works: if the process is manual write the steps necessary to accomplish it; if the process is automatic, link to the page to consult the deployment status. Take the following as an example:

To deploy the app run `bin/deploy`

More Sections
-------------

This section is just a placeholder. You can replace it with any section or sections. Here you can write everything you feel the reader should know should about the project. This is the place to document other commands that are available to the user, or instructions on how to do something that's manual

Contribution Guidelines
-----------------------

Contributions must follow [Subvisual's guides](https://github.com/subvisual/guides).

Resources
---------

This section should list every online resource that is relevant to the project. For instance:

* Link to spec file on Google Drive
* Link to Invision files.
* ...

License
-------

_Only relevant for public repositories._

PROJECT_NAME is copyright &copy; 2020 Subvisual, Lda.

It is open-source, made available for free, and is subject to the terms in
its [license].


About
-----

PROJECT_NAME was created and is maintained with :heart: by
[Subvisual][subvisual].

[![Subvisual][subvisual-logo]][subvisual]


[license]: ./LICENSE.txt
[subvisual]: http://subvisual.com
[subvisual-logo]: https://raw.githubusercontent.com/subvisual/guides/master/github/templates/logos/blue.png
