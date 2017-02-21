# DevOps Protocol

A set of guidelines, checklists and tutorials for deploying web apps in a sane
and reproduceable way.

## Table of Contents

* [Continuous Integration](#continuous-integration)
* [Servers](#server-setup)
* [Static websites](#static-websites)
* [DNS](#server-setup)
* [SSL](#server-setup)
    * [Sabayon Samples](#sabayon-samples)

## Continuous Integration

* Use [SemaphoreCI] ([TravisCI] is also fine for open source, but tends to be
    slower)
* Set up automatic deploys to staging (from the `master` branch), and manual
    deploys to production
* Ensure you can deploy your application to all environments without having to
    configure any CLI tools, so that no team member needs to individually set up any required deploy keys. This can be done by configuring deploys on your CI or, if they're an option for your project, via [Heroku Pipelines].

## Servers

* Use [Heroku] unless project requirements or client deem otherwise
* Set up a staging environment in addition to the production one
* Set up [Heroku's Review Apps]

## Static websites

For websites with no back-end, we prefer to host them on Amazon S3.

The guide for this is still a TODO. In the meantime, please refer to
[@naps62](mailto:miguel@subvisual.co) for help.

## DNS

* Use [DNSimple], especially if the project is hosted on Heroku
  * If DNSimple is not an option, look for a provider with
      support for `ALIAS` records (pointing the root domain to Heroku is not
      possible otherwise)
  * If that is also not an option (i.e.: If you're using Godaddy or Namecheap),
      ask [@naps62] for advice
  * More info on this can be found on [Heroku with custom root domain]
* Use `test.you-project.com` or `staging.your-project.com` as the staging
    environment

## SSL

* Use [Let's Encrypt]
* On Heroku, you can set up [Sabayon] to automate the periodic certificate renewal.
    1. Deploy Sabayon to a new Heroku app (call it `your-project-letsencrypt`)
    2. Follow Sabayon's README for instructions  on how to configure it
    3. Configure your app to use Sabayon's environment variables (see [Sabayon
        samples](#sabayon-samples) for examples on how to do this)
    4. Manually call sabayon to make sure the renewal is working correctly

## Sabayon Samples

* [Ruby on Rails](samples/sabayon-rails.md)
* Phoenix: TODO
* NodeJS: TODO

TODO (please poke @naps62)

[SemaphoreCI]: https://semaphoreci.com/
[TravisCI]: https://travis-ci.org/
[Heroku]: https://heroku.com/
[Heroku's Review Apps]: https://devcenter.heroku.com/articles/github-integration-review-apps
[Heroku with custom root domain]: https://devcenter.heroku.com/articles/custom-domains#add-a-custom-root-domain
[DNSimple]: https://dnsimple.com/dashboard
[@naps62]: mailto:miguel@subvisual.co
[Let's Encrypt]: https://letsencrypt.org/
[Sabayon]: https://github.com/dmathieu/sabayon
[Heroku Pipelines]: https://devcenter.heroku.com/articles/pipelines
