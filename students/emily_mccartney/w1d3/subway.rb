require 'pry'
require 'pry-debugger'

subway = {}
subway[:n] = %w(ts 34th 28th 23rd us 8th)
subway[:l] = %w(8th 6th us 3rd 1st)
subway[:l6] = %w(gc 33rd 28th 23rd us ap)


puts "what is your start line"
print "n, l, l6"
startline = gets.chomp.downcase.to_sym

puts "which station do you want to get on?"
startstation = gets.chomp.downcase

puts "what is your end line"
print "n, l, l6"
endline = gets.chomp.downcase.to_sym

puts "which station do you want to get off?"
endstation = gets.chomp.downcase

if startline != endline

   a_intersection = "us"
   b_intersection = "us"

   a_index = subway[startline].index(startstation)
   a_intersection_index = subway[startline].index(a_intersection)

   b_index = subway[endline].index(endstation) 
   b_intersection_index = subway[endline].index(b_intersection)
   
   #firstline
   if a_index > a_intersection_index
    a_journey = subway[startline][a_intersection_index..a_index]

   else
    a_journey = subway[startline][a_index..a_intersection_index]
   end

   if b_index > b_intersection_index

    b_journey = subway[endline][b_intersection_index..b_index]
   
   else

    b_journey = subway[endline][b_index..b_intersection_index].reverse
   end

   result = a_journey + b_journey
   puts result
  else
   startindex = subway[startline].index(startstation)
   endindex = subway[endline].index(endstation)

   # single line
   result = subway[startline][startindex..endindex]
   puts result
  end
