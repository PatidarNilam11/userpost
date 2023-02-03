class HomeController < ApplicationController
    def index
        @posts = Post.all.includes(:likes)
      end
end
