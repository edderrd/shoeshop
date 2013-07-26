class HomeController < ApplicationController

    def index
        @articles = Article.recent.limit(10)
        @stores = Store.recent.limit(10)
    end
end
