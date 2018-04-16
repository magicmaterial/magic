class PostController < ApplicationController
  before_action :authenticate_user,{only: [:show,:new,:create,:edit,:edit_form,:destroy,:destroy_form,:update]}
  #before_action :ensure_current_user,{only: [:edit_form]}
  
  def new
    @post = Post.new
  end
  
  def show
    @post = Post.all
  end
  
  def create
    @post = Post.new(content: params[:content])
    if @post.save
    flash[:notice] = "投稿完了しました"
    redirect_to("/post/show")
    else
    @content = params[:content]
    render("/post/new")
    end
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
    flash[:notice] = "投稿更新完了"
    redirect_to("/post/show")
    else
    @content = params[:content]
    render("/post/edit_form")
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/post/show")
  end
  
  def edit_form
    @post = Post.find_by(id: params[:id])
    
  end
end
