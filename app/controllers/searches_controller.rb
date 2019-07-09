class SearchesController < ApplicationController  
  layout 'search'

  def index   
    @blogs = Blog.where("title ILIKE ?", "%" + params[:search] + "%")
    @portfolios = Portfolio.where("title ILIKE ?", "%" + params[:search] + "%")
    @topics = Topic.where("title ILIKE ?", "%" + params[:search] + "%")
  end



  #put in model
  #search suggestions did you mean..
  #order most popular
end 