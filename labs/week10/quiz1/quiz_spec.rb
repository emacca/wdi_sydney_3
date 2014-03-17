# .______       _______ .___  ___.      ___       __  .__   __.      ______     ___       __      .___  ___.
# |   _  \     |   ____||   \/   |     /   \     |  | |  \ |  |     /      |   /   \     |  |     |   \/   |
# |  |_)  |    |  |__   |  \  /  |    /  ^  \    |  | |   \|  |    |  ,----'  /  ^  \    |  |     |  \  /  |
# |      /     |   __|  |  |\/|  |   /  /_\  \   |  | |  . `  |    |  |      /  /_\  \   |  |     |  |\/|  |
# |  |\  \----.|  |____ |  |  |  |  /  _____  \  |  | |  |\   |    |  `----./  _____  \  |  `----.|  |  |  |  __
# | _| `._____||_______||__|  |__| /__/     \__\ |__| |__| \__|     \______/__/     \__\ |_______||__|  |__| (__)
require_relative '../quiz'

# The first question's tests are written.
# run rspec quiz_spec.rb
describe "question 1: a function called sleep_in?" do

  it "returns true if the current day is Saturday or Sunday" do
    # assuming you're answering this on a weekday!
    expect(sleep_in?).to be(false)
  end

  it "takes an options hash as a parameter" do
    parameters = method(:sleep_in?).parameters.first
    expect(parameters).to include(:options)
  end

  it "returns true if vacation is true" do
    question_1 = sleep_in?(vacation: true)
    expect(question_1).to be(true)
  end
end

# Write the next tests yourself!
# See quiz.rb for more details

# Question 2: a function called del_del
  # Example Usage:
  # del_del("abdelcd") => "abcd"
  # del_del("xyz") => "xyz"
describe "del_del" do

  it "removes 'del' from strings" do
    expect(del_del("abcdeld")).to eq("abcd")
  end

  it "leaves regular strings in tact" do
    expect(del_del("xyz")).to eq("xyz")
  end
end
# Question 3: a function called missingChar
  # Example Usage:
  # missing_char("kittie", 1) => "kttie"
  # missing_char(347, 1) => RuntimeError: Please enter a string!
  # https://www.relishapp.com/rspec/rspec-expectations/v/2-0/docs/matchers/expect-error
describe "missing_char" do

  it "removes a letter at a specified index" do
    expect(missing_char("kittie", 1)).to eq("kttie")
  end

  it "throws an error if passed a number" do
    expect{missing_char(347, 1)}.to raise_error
  end
end
# Question 4: a function called near_hundred
  # Example Usage:
  # near_hundred(93) => true
  # near_hundred(52) => false
  # near_hundred('two') => RuntimeError: Please enter a number!
describe "near_hundred" do

  it "returns true if a number is between 90 and 100" do
    expect(near_hundred(93)).to be(true)
  end
  it "returns false if a number is below 90 or above 100" do
    expect(near_hundred(52)).to be(false)
    expect(near_hundred(101)).to be(false)
  end
  it "throws an error if passed a string" do
    expect{near_hundred('two')}.to raise_error
  end
end
# Question 5: a method called back_around
  # Example Usage:
  # "cat".back_around => "tca"
  # "hello".back_around => "ohell"
describe "back_around" do
  it "returns a string with the final letter placed first" do
    expect("cat".back_around).to eq("tca")
  end
end