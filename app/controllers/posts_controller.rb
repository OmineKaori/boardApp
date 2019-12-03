class PostsController < ApplicationController
  before_action:authenticate_user
  before_action:ensure_correct_user,{only: [:edit,:update,:dastroy]}

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id:params[:id])
    @user = @post.user
    @likes_count=Like.where(post_id:@post.id).count
    @replies=Reply.where(post_id:@post.id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(content:params[:content],user_id:@current_user.id)
    if @post.save
      flash[:notice] = "新規スレッドを作りました"
      if params[:image]
        @post.image_name="#{@post.id}.jpg"
        image = params[:image]
        File.binwrite("public/post_images/#{@post.image_name}",image.read)
      end
      @post.save
      redirect_to("/posts/index")
    else
      render("/posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content=params[:content]
    if @post.save
      flash[:notice]="編集完了しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy
      flash[:notice]="削除しました"
      redirect_to("/posts/index")
    end
  end

  def ensure_correct_user
    @post=Post.find_by(id:params[:id])
    if @post.user_id!=@current_user.id
      flash[:notice]="権限がありません"
      redirect_to("/posts/index")
    end
  end

  def create_reply
    @reply = Reply.new(content:params[:content],user_id:@current_user.id,post_id:params[:post_id])
    if @reply.save
      flash[:notice] = "返信しました"
      @reply.save
      redirect_to("/posts/#{params[:post_id]}}")
    end
  end

  def destroy_reply
    @reply = Reply.find_by(id: params[:id])
    post_id=@reply.post_id
    if @reply.destroy
      flash[:notice]="削除しました"
      redirect_to("/posts/#{post_id}")
    end
  end


end
