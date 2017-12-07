# Ruby Gem: Capistrano::pm2

Node.js [pm2](http://pm2.keymetrics.io) support for Capistrano 3.x

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano', '~> 3.5.0'
gem 'capistrano-pm2', git: 'https://github.com/aidistan/capistrano-pm2.git'
```

And then execute:

```bash
$ bundle
```

## Usage

Require in `Capfile` to use the default task:

```ruby
require 'capistrano/pm2'
```

The `pm2:startOrRestart` task will run after `deploy:published` as part of
Capistrano's default deploy.

### Available Tasks

```bash
cap pm2:start
cap pm2:restart
cap pm2:reload
cap pm2:stop
cap pm2:delete
cap pm2:list
cap pm2:logs
cap pm2:save
```

### Configurable options

```ruby
set :pm2_roles, :all # default, cap roles to run on
```
