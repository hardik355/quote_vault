class QuotesController < ApplicationController
	def random
    quotes = [
      "The only limit to our realization of tomorrow is our doubts of today. - Franklin D. Roosevelt",
      "Do not wait to strike till the iron is hot; but make it hot by striking. - William Butler Yeats",
      "Whether you think you can, or you think you can’t, you’re right. - Henry Ford"
    ]
    render json: { quote: quotes.sample }
  end
end
