class StorysController < ApplicationController
  layout "story"

  def my_story
    @posts = Blog.all
    @skills = Skill.all
  end 
end 