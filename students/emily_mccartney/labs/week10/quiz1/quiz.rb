# .___________. __    __   __       _______.    __       _______.        ___           ______      __    __   __   ________
# |           ||  |  |  | |  |     /       |   |  |     /       |       /   \         /  __  \    |  |  |  | |  | |       /
# `---|  |----`|  |__|  | |  |    |   (----`   |  |    |   (----`      /  ^  \       |  |  |  |   |  |  |  | |  | `---/  /
#     |  |     |   __   | |  |     \   \       |  |     \   \         /  /_\  \      |  |  |  |   |  |  |  | |  |    /  /
#     |  |     |  |  |  | |  | .----)   |      |  | .----)   |       /  _____  \     |  `--'  '--.|  `--'  | |  |   /  /----.__
#     |__|     |__|  |__| |__| |_______/       |__| |_______/       /__/     \__\     \_____\_____\\______/  |__|  /________(__)

# Question 1: a function called sleep_in?
#############
# Write a function called sleep_in?
# You can sleep in if it is not a weekday or if you are on vacation.
# sleep_in? => false
# sleep_in?(vacation: true) => true

def sleep_in?(options = {})
  currentTime = Time.now 
  #the vacation is the key in the options hash and it tests to see if the vacation is in there, if it is true it is there 
  #also tests if the day is saturday oor sunday 
  if  options[:vacation] == true || currentTime.saturday? || currentTime.sunday? 
    return true
  else 
    false
  end
end

# Question 2: a function called del_del
#############
# Remove "del" from a string.
# del_del("abdelcd") => "abcd"
# del_del("xyz") => "xyz"
def del_del(string)
  del = 'del'
  if string.include? del
    string.slice! del
    string    
  else
    string
  end

end

# Question 3: a function called missing_char
#############
# Remove the character that corresponds to the index from the string.
# If you don't enter a string
# missing_char("kittie", 1) => "kttie"
# missing_char(347, 1) => RuntimeError: Please enter a string!
def missing_char(string, num)
  if string.class == Numeric 
    raise "You cant enter in a number first"
  else
    array = string.split("")
    array.delete_at(num)
    array.join
  end
end

# Question 4: a function called near_hundred
#############
# Write a function called near_hundred
# If the number is between 90 and 99, the result is true;
# If it is 89 or below, it is false.
# near_hundred(93) => true
# near_hundred(52) => false
# near_hundred('two') => RuntimeError: Please enter a number!
def near_hundred(num)
  num.between?(90,99)
end

# Question 5: a method called back_around
#############
# Given a string, move the last character to the beginning.
# "cat".back_around => "tca"
# "hello".back_around => "ohell"
#extend the sring class with back around function
class String
  def back_around
    array = self.split("")
    lastLetter = array.pop
    array.insert(0,lastLetter)
    array.join
  end
end