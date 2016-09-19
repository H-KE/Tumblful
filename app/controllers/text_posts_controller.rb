class TextPostsController < ApplicationController
    def index
        @text_posts = TextPosts.all
    end
    
    def show
        @text_posts = TextPosts.find(params[:id])
    end
    
    def new
    
    end
    
    def edit
        @text_posts = TextPosts.find(params[:id])
    end
    
    def create
        @text_posts = TextPosts.new(text: params[:text_posts][:text], title: params[:text_posts][:title])
        if @text_posts.save
          redirect_to text_posts_path
        else
          @errors = @text_posts.errors
          render :new
        end
    end
    
    def update
        @text_posts = TextPosts.find(params[:id])
        if @text_posts.update(link: params[:text_posts][:text], title: params[:text_posts][:title])
          redirect_to text_posts_path
        else
          @errors = @text_posts.errors
          render :edit
        end
    end
    
    def delete
        @text_posts = TextPosts.find(params[:id])
        @text_posts.destroy
        redirect_to text_posts_path
    end
end
