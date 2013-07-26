class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
    @rest_options = get_rest_options(success: false)

    respond_with(@articles)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @stores = Store.all
    flash[:notice] = 'Article was successfully created.' if @article.save
    respond_with(@article)
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    flash[:notice] = 'Article was successfully updated.' if @article.update(article_params)
    respond_with(@article)
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_with(@article)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:name, :description, :price, :total_in_shelf, :total_in_vault, :store_id)
    end
end
