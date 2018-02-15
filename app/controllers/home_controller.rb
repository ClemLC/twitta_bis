class HomeController < ApplicationController
  def index
    end

    def create
      SendTweet.new(params[:tweet][:text]).perform
      redirect_to root_path
    end
  end
end
