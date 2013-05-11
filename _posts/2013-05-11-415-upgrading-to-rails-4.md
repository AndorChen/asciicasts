---
layout: episode
title: 升级到 Rails 4
date: 2013-05-11 00:57
episode: 415
railscasts_url: http://railscasts.com/episodes/415-upgrading-to-rails-4
---

You’re probably aware that the various Rails commands can be a little slow to run. If we run, say, a generator for a Rails application there is a delay of several seconds before we see any output. This is because the application is started up when these commands are run and this is most noticeable when running tests as these are run often when a application is in development. This wait time only grows as the application gets larger. In this episode we’ll show you a few different tools that we can use to make these commands run much more quickly.

## Zeus

The first one of these is called Zeus and it preloads Rails applications so that we can run commands against them almost instantly. It has some fairly strict requirements, however, and you’ll need to be running a recent version of OS X or Linux and Ruby 1.9.3 with the garbage collection patch to use it. It does seem to work without that patch applied but it might be necessary to use it if you have limited RAM. To install it we just need to run `gem install zeus`. We shouldn’t add it to an application’s gemfile as it’s designed to run outside Bundler with the zeus command. Once it’s installed we can run zeus start to preload our application.
