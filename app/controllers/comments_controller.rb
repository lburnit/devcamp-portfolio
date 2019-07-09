class CommentsController < ApplicationController
  layout "blog"
  before_action :set_comment, only: [:show, :edit, :update, :destroy, :like, :unlike]

  def create 
    #@comment = current_user.comments.build(comment_params)
    #@blog = Blog.includes(:comments).friendly.find(params[:id])
    #@comments = @blog.comments.create(comment_params)
    #@comment.user_id = current_user.id
     @blog = Blog.find params[:blog_id]
      @comment = @blog.comments.new comment_params
      @comment.save
  end 

  def show
   #@comment = @blog.comments.build
  end 

  def new 
    @comment = Comment.new(:parent_id => params[:parent_id])
    #?@replies = @comment

  end 

  def reply
    @blog = Blog.find params[:blog_id]
    @comment = Comment.new
    @parent = params[:id]

    render :new
  end 

  def like 
    @comment.liked_by current_user
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.js { render layout: false }
    end
  end  

  def unlike
    @comment.unliked_by current_user
    respond_to do |format|
      format.html {  redirect_to request.referrer }
      format.js { render layout: false }
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html {  redirect_to request.referrer }
      format.js { render layout: false }
    end
  end

  def update_comment
    @comment = Comment.find(params[:id])
    @comment.update(params[:comment].permit(:content))
  end

  def discussion
    @blog = Blog.includes(:comments).friendly.find(params[:id])
    @comments = @blog.comments.order("comments.created_at desc").page(params[:page]).per(10)
  end 

  private 
  

  def comment_params
    params.require(:comment).permit(:content, :blog_id)
  end

  def set_comment 
    @comment = Comment.find(params[:id])
  end 
end
