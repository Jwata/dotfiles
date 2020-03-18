begin
  require 'pry'
  Pry.start
  exit
rescue LoadError
  puts "Pry wasn't installed"
end
