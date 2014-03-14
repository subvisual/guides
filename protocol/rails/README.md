Protocol
========

A guide for getting things done.

Create Rails app
----------------

* Create a rails project locally

    rails new dummy

* Create a github repo on http://github.com/new and follow the instructions to add
your code to the repo. Create the repo on the groupbuddies organizations. Create
the repo on the groupbuddies organization.

* Create a `dev` branch.

* Create a `bin/setup` script that sets up everything required to start using
the app.

Set up Rails app
----------------

Set up the app's dependencies.

    cd your/projects/folder
    git clone git@github.com:groupbuddies/name-of-the-app.git
    cd name-of-the-app
    bin/setup

Deploy
------

Enjoy the Semaphoreapp automatic deploy to staging if it is set up.

Use the Semaphoreapp on-click deploy button, if it is set up. Alternatively, run:

    bundle exec cap [production|staging] deploy

Make sure everything's ok. Sometimes you'll need to manually restart services.

