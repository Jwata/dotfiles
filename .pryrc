begin
  require 'looksee'
  require 'awesome_print'
  AwesomePrint.pry!
rescue Exception => e
  puts e.message
end
