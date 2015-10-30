# Web Deploy Protocol

A guide for deploying web apps in a sane and repeatable way

**NOTE:** everything described here should be replicated in the [example app](https://github.com/subvisual/gb-puppet-test-app)

# Server setup

* Use [DigitalOcean](https://www.digitalocean.com/). Be sure to select the `Enable Backups` feature, which can only be enabled during creation
* Use Ubuntu 12.04 (Precise Pangolin) x64, unless you have specific reasons to do otherwise (upstart has issues in later versions)
* Provision the server using [GB Puppet](https://github.com/subvisual/gb-puppet). Follow the README there for the appropriate steps.
* After the initial setup, avoid SSH'ing to the server, unless strictly necessary.
* Store all required data (passwords, IP address, any decisions made, etc) in a secure location, but accessible to the team

# App setup

* Provision the app using [Subvisual Puppet's app provisioning script](https://github.com/subvisual/gb-puppet). Follow the README there for the appropriate steps.
* Never include sensitive production data in the repo (even if it's private)
* Include a `Procfile.production` (and `Procfile.staging`, if applicable)
* A `.env` file should exist in the server with all env data required (including PATH)
* Use [capistrano3-env](https://github.com/naps62/capistrano3-env) to manage `.env` data on the server.

# Provision the machine

* Have manifest files to provision the machine with anything the app needs (ruby, Node.js, a Postgres database, etc). Check the [example app](https://github.com/subvisual/gb-puppet-test-app) for more details.
* Keep sensitive data (i.e. system passwords) outside the repo.
