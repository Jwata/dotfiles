begin
  Bundler.require if defined? Bundler
  AwesomePrint.pry! if defined? AwesomePrint
  require 'looksee'
rescue Exception => e
  puts e.message
end
