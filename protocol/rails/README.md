Rails Protocol
==============

A guide for writing great web apps.

Create Rails app
----------------

* Create a rails project locally

    rails new dummy

* Create a github repo on http://github.com/new and follow the instructions to add
your code to the repo. Create the repo on the Subvisual organizations.

* Create a `dev` branch.

* Create a `bin/setup` script that sets up everything required to start using
the app.

Set up Rails app
----------------

Set up the app's dependencies.

    cd your/projects/folder
    git clone git@github.com:subvisual/name-of-the-app.git
    cd name-of-the-app
    bin/setup

Git Protocol
------------

Follow the normal [Git Protocol](/protocol/git)

Set up production environment
-----------------------------

* Add [`vagrant`](https://github.com/mitchellh/vagrant),
  [`librarian-puppet`](https://github.com/rodjek/librarian-puppet) and
  [`puppet`](https://github.com/puppetlabs/puppet) to the Gemfile, in
  the`:deploy` group

* In the shared Dropbox folder "GB Classified", go to "Sysadmin/project_name"
create the following files:

  * `env.vagrant`
    ```
    DIGITAL_OCEAN_CLIENT_ID=clientid
    DIGITAL_OCEAN_API_KEY=verysecretkey
    ```

  * `server_configs.yaml`
    ```
    ---
    project_name:
      deploy_password: "iamasecret"
      production:
        db_password: "database password"
        url: "app.project_name.com"
      staging:
        db_password: "staging database password"
        url: "test.project_name.com"
    ```

* Create a `deploy` folder in the repo with the files you just created

* Add those files to `.gitignore`

* In the `deploy` directory

  * Create a `server_configs.pp` with the following structure:

    ```
    $data = hiera('server_configs')

    class { 'gb':
      ruby_version    => 'ruby version for the project',
      deploy_password => $data[deploy_password],
    }

    gb::app::rails { 'project_name_production':
      db_pass => $data[production][db_password],
      url     => $data[production][url],
    }

    gb::app::rails { 'project_name_staging':
      db_pass   => $data[staging][db_password],
      url       => $data[staging][url],
      rails_env => 'staging',
    }
    ```

  * Add the default [`hiera.yaml`](/protocol/rails/samples/hiera.yaml),
    [`Puppetfile`](/protocol/rails/samples/Puppetfile),
    [`upgrade_puppet.sh`](/protocol/rails/samples/upgrade_puppet.sh) and
    [`Vagrantfile`](/protocol/rails/samples/Vagrantfile).

* Run the following commands:

    ```
    librarian-puppet install
    vagrant plugin install vagrant-digitalocean
    vagrant plugin install dotenv
    vagrant up --provider=digital_ocean
    ```

Deploy
------

Enjoy the Semaphoreapp automatic deploy to staging and the on-click deploy
button if it is set up.

Alternatively, configure it yourself:

* Add [capistrano gems](/protocol/rails/samples/capistrano) to the Gemfile to the `:deploy` group

* Create a [`Capfile`](/protocol/rails/samples/Capfile)

* Create a [`config/deploy.rb`](/protocol/rails/samples/deploy.rb)

* Create a `config/deploy` directory with a
[`production.rb`](/protocol/rails/samples/production.rb) and a
[`staging.rb`](/protocol/rails/samples/staging.rb) files

* Now you can deploy it by running:

        bundle exec cap [production|staging] deploy

  Or you can set up Semaphoreapp by going to "settings > Deployment > Add
  Server". The deploy commands should be:

      bundle install --path vendor/bundle --without default production assets test development
      bundle exec cap [production|staging] deploy

Make sure everything's ok. Sometimes you'll need to manually restart services.

Communication
-------------

Follow the normal [Communication Protocol](/protocol/communication)
