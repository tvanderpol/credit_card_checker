#!/usr/bin/env ruby
require_relative 'lib/main'

file = ARGV[0]

if !file || file == "-h"
  puts """
Please supply a file name as your first argument, like this:
cc_check.rb file_name.txt
"""
else
  if File.exists?(file) && File.readable?(file)
    fh = File.open(file, "r") { |file|
      file.each do |line|
        cc = CreditCard.new(line)
        validity = cc.valid? ? "valid" : "invalid"
        puts "#{cc.type}: #{cc.number}  (#{validity})"
      end
    }
  else
    puts "That's not a valid file or the file is not readable."
  end
end