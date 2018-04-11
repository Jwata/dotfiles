begin
  require 'bundler/setup'
  Bundler.require if defined? Bundler
  AwesomePrint.pry! if defined? AwesomePrint
  require 'looksee'
  require 'pry-byebug'
  require 'awesome_print'
rescue Exception => e
  puts e.message
end
