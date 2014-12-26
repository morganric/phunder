#!/usr/bin/env ruby

require 'rubygems'
require 'chatterbot/dsl'

#
# this is the script for the twitter bot artupioRT
# generated on 2014-12-26 00:21:18 +0000
#

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = 'g50yZMhTs0CVgyy4baSiLPG2g'
  config.consumer_secret     = "mqUnS9BHQ0O6Uh9ccAYEjFM3jQC4R0NUofBQLACtqMleUsQQ5c"
  config.access_token        = "2941543432-shHNePQpyjkd4g9r56flC9BoL4nYC5nksZdnqSz"
  config.access_token_secret = "uvsOxlIH5flrAcjxrhONRqSgnNhuaxRz51JVzrh9PooBH"
end


consumer_key 'g50yZMhTs0CVgyy4baSiLPG2g'
consumer_secret 'mqUnS9BHQ0O6Uh9ccAYEjFM3jQC4R0NUofBQLACtqMleUsQQ5c'

secret 'uvsOxlIH5flrAcjxrhONRqSgnNhuaxRz51JVzrh9PooBH'
token '2941543432-shHNePQpyjkd4g9r56flC9BoL4nYC5nksZdnqSz'

# remove this to send out tweets
debug_mode

# remove this to update the db
no_update
# remove this to get less output when running
verbose

# here's a list of users to ignore
blacklist "abc", "def", "BUYCAMERANOW"

# here's a list of things to exclude from searches
exclude "hi", "spammer", "junk", "nude", "#nude", "#sexy", "sexy"

loop do

client.search('#art -rt', :result_type => 'recent').take(3).each do |tweet|
	puts tweet.text

	if tweet.created_at > client.home_timeline.first.created_at
		client.retweet(tweet.id)
	end
end

sleep 5.minutes
end
