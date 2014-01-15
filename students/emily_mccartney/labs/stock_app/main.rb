require "sinatra"
require "sinatra/reloader" if development?
require "yahoofinance"
require "active_support/all"

get "/" do
  # if params[:symbol].nil? && params[:symbol].empty?
  if params[:symbol].present? #this is part of rails, it check for nil and empty
    @symbol = params[:symbol].upcase
    @quote = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol].lastTrade
    @quote2 = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol].name
  end
erb :quote
end

post "/" do
if params[:symbol].present? #this is part of rails, it check for nil and empty
    @symbol = params[:symbol].upcase
    @quote = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol].lastTrade
    @quote2 = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol].name
  end
erb :quote

end