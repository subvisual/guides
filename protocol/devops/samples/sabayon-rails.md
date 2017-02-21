# Sabayon Setup - Ruby on Rails 5

Instructions on how to setup [Sabayon](https://github.com/dmathieu/sabayon) for
Ruby on Rails apps

## 1. Set up a route

We avoid the middleware suggested by sabayon because it creates unnecessary
overhead for all of the app's requests. We prefer to treat Let's Encrypt
requests as first class citizens of the Rails app instead.

```ruby
# config/routes.rb

Rails.application.routes.draw do
  # ...

  get "/.well-known/acme-challenge/:token", to: "acme#challenge"
```

## 2. Create a controller

This controller will handle the route created in the previous step, by looping
through the environment variables created by Sabayon to respond with the
appropriate key.

```ruby
class AcmeController < ApplicationControlller
  def letsencrypt
    valid_data = acme_data.find do |item|
      item[:token] == params[:token]
    end

    if valid_data
      render body: valid_data[:key]
    else
      head :ok
    end
  end

  private

  def acme_data
    if ENV["ACME_KEY"] && ENV["ACME_TOKEN"]
      [{ key: ENV["ACME_KEY"] ,token: ENV["ACME_TOKEN"] }]
    else
      ENV.each_with_object([]) do |(key, value), data|
        regex_match = key.match(/^ACME_KEY_[0-9]+/)

        if regex_match
          data.push(key: value, ENV["ACME_TOKEN_#{regex_match[1]}"])
        end
      end
    end
  end
end
```

## 3. Add some specs

It is advisable to add automated tests for this controller. Luckily, we have
[a sample for you](acme_controller_spec.rb) (depends on [rspec](https://github.com/rspec/rspec) and [climatecontrol](https://github.com/thoughtbot/climate_control) gems)
