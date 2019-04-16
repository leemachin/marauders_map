# Marauder's Map

**Domain Driven Rails Routes**


## Redefining your Routes

By convention, Rails reads your routes file at the initialisation stage and
then discards the routes API at run time. 

As a Rails app grows in size and complexity, and as the teams maintain it grow
larger, the traditional structure can leave something to be desired. One common
approach at this point is to separate logically consistent routes into their own
files, adding some extra code to draw those routes files from a `config/routes`
folder or similar.

What if you're shifting towards DDD though? It's becoming more popular to
organise your code by domain or feature. 

This is often done when building single page apps in React, in order to colocate
relevant components, HOCs, graphql queries, styles, and images. It's a different
approach to having a massive components folder, a massive styles folder, etc.

This is more or less how Rails does it: all your models go in one folder, your
controllers in another. Each have their own concerns folder. Other folders might
appear if you start to use presenters, decorators, and other design patterns.

The colocation pattern that is becoming more popular in Javascript-land is
something that can work just as well in a Rails app that has a growing need for
Service Oriented Architecture, or it's bosom buddy Domain Driven Development.

For the most part Rails handles this okay: Ruby is Ruby, it doesn't matter where
you put it, it is only driven by convention. This is not so with routes, which
are only loaded on application startup.

This means that colocating your routes will lead to runtime errors as Rails
can't eager load those files: the API is no longer available to use, so you will
encounter `NoMethodError`s that only exist in production (eager load is not the
same as autoload).

This gem takes inspiration from more enterprisey frameworks like Spring and
Symfony, where routes are typically defined per service/bundle/domain and are
also written in a serializable format like YAML or XML.

Rails routes are quite dynamic, so the preference here is to use HCL to offer
some similarity to Ruby.

## Defining your new routes

Suppose you have a domain responsible for making the Sorting Hat work, which is
how Hogwarts students are assigned to their houses: Gryffindor, Hufflepuff, etc.
All of the models, controllers, and business logic live in
`app/domains/sorting_hat`.

You want to move your routes there too so you make a new file:
`app/domains/sorting_hat/routes.rb`.

This works brilliantly in development and all your tests will pass, however,
production won't boot up! The file is being eager loaded and routes are no
longer able to be defined. Oh no!

So you put `gem 'marauders_map'` into your Gemfile and then wrap your routes:

``` ruby
MaraudersMap.draw do
  # your Rails routes
end
```

The gem will do the rest.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'marauders_map'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install marauders_map


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/marauders_map.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
