class ArticlesController < ApplicationController
  
  before_action :set_store
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  respond_to :html


  # GET /stores/1/articles
  def index
    @articles = @store.articles.to_a
  end

  # GET /articles/1
  def show
  end

  # GET /articles/new
  def new
    @article = @store.articles.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    @article = @store.articles.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to [@store,@article], notice: 'Article was successfully created.' }
      else
        format.html { render action: 'new' }
      end
      format.all { render_404 }
    end
  end

  # PATCH/PUT /articles/1
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to [@store,@article], notice: 'Article was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to store_articles_url(@store) }
    end
  end

  private
    # Find the store object.
    def set_store
      @store = Store.find(params[:store_id])
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = @store.articles.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:name, :description, :price, :total_in_shelf, :total_in_vault, :store_id)
    end
end
