# for special pry console with Sinatra models preloaded. 
# This file will load each model file before pry session starts.
# To use pry console with models loaded, type "pry -r './mconsole'"
# in top level project folder

if $mongo_loaded.nil?

  require 'mongoid'

  all_files = Dir.glob("*.rb")

  all_files.instance_eval do |i|
    i.delete("mconsole.rb")
    i.map do |x| 
      x.slice!(".rb")
      x.replace "./" + x
    end
  end

  all_files.each(&method(:require))

end