class UserController < ApplicationController
  before_action :authenticate_user,{only: [:update,:member,:destroy,:destroy_form]}
  before_action :forbid_login_user,{only: [:new,:login,:new_entry,:login_form]}
  
  
  def login_form
    @user = User.new
  end
  
  def login
    @user = User.find_by(name: params[:name],
                         email: params[:email])
    if @user
    session[:user_id] = @user.id
    flash[:notice] = "ログインしました"
    redirect_to("/post/show")
    else
    @error_message = "メールアドレスまたはパスワードが間違っています"
    @name = params[:name]
    @email = params[:email]
    render("/user/login_form")
    end
    
  end
  
  def new
    @user = User.new
  end
  
  def new_entry
    
    @user = User.new(name: params[:name],
                     email: params[:email],
                     image: "epo.jpg")
    
    if @user.save
    session[:user_id] = @user.id
    flash[:notice] = "新規登録完了"
    redirect_to("/post/show")
    else
      @name = params[:name]
      @email = params[:email]
      render("/user/new")
    end
  end
  
  def member
    @user = User.all
  end
  
  def destroy_form
    @user = User.find_by(id: params[:id])
  end
  
  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    flash[:notice] = "削除完了"
    redirect_to("/login_form")
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end
  
  def ensure_current_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/post/show")
    end
  end
  
  def update
    @user = User.find_by(id: @current_user.id)
    @user.name = params[:name]
    @user.email = params[:email]
    if params[:image]
     @user.image = "#{@user.id}.jpg"
     image = params[:image]
     File.binwrite("public/#{@user.image}",image.read)
    end
    if @user.save
      
      flash[:notice] = "更新完了しました"
      redirect_to("/user/#{@current_user.id}/edit_form")
    else
      @error_message = "名前またはメールアドレスを入力して下さい"
      render("/user/destroy_form")
    end
  end
  
end
