class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :authenticate, except: [:index, :show] # Ensure authentication is required for relevant actions
    
    def index
      @posts = Post.order(published_at: :desc)
    end
    
    def show
    end
    
    def new
      @post = Post.new
    end
    
    def create
      @post = Post.new(post_params)
      
      if @post.save
        redirect_to @post
      else
        render :new
      end
    end
    
    def edit
    end
    
    def update
      if @post.update(post_params)
        redirect_to @post
      else
        render :edit
      end
    end
    
    def destroy
      @post.destroy
      redirect_to posts_path
    end
  
    # Make sure this method is not inside the private block
    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        session[:authenticated] = (username == "username" && password == "password")
      end
    end
  
    def authenticated?
      session[:authenticated]
    end
  
    helper_method :authenticated? # Make authenticated? available in views
    
    private
    
    def set_post
      @post = Post.find(params[:id])
    end
    
    def post_params
      params.require(:post).permit(:title, :body, :published_at)
    end
  end
  