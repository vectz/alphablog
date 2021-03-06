class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :destroy, :show]
  
  def index
  @articles = Article.all
    
  end
 
  def new
    @article = Article.new
    
  end
  
  
 
  def edit
    
  end
  
  def destroy
   
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end
  
  
 def create
    @article = Article.new(article_params)
    if @article.save
     flash[:success] = "Article was Successfully Created"
     redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def update
    
    if @article.update(article_params)
      flash[:success] = "article was sucessfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
 
  
  def show
  
  end

  private
  
  def set_article
    @article = Article.find(params[:id])
  
    def article_params
      params.require(:article).permit(:text, :description)
    end
    
  end
end