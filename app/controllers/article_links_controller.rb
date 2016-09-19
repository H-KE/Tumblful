class ArticleLinksController < ApplicationController
    def index
        @article_links = ArticleLink.all
    end
    
    def show
        @article_link = ArticleLink.find(params[:id])
    end
    
    def new
        @article_link = ArticleLink.new
    end
    
    def edit
        @article_link = ArticleLink.find(params[:id])
    end
    
    def create
        @article_link = ArticleLink.new(url: params[:article_link][:url], title: params[:article_link][:title])
        if @article_link.save
          redirect_to article_links_path
        else
          @errors = @article_link.errors
          render :new
        end
    end
    
    def update
        @article_link = ArticleLink.find(params[:id])
        if @article_link.update(url: params[:article_link][:url], title: params[:article_link][:title])
          redirect_to article_link_path
        else
          @errors = @article_link.errors
          render :edit
        end
    end
    
    def delete
        @article_link = ArticleLink.find(params[:id])
        @article_link.destroy
        redirect_to article_link_path
    end
end
