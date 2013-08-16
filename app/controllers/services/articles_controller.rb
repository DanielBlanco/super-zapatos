class Services::ArticlesController < Services::BaseController

  before_filter :set_store, :only => [:index_store]
  
  # GET /articles
  def index
    @articles = Article.all
  end
  
  # GET /articles/stores/:id
  def index_store
    @articles = @store.articles.all
    render :index
  end
  
  private
  
    # Find the store by :id.
    def set_store
      @store = Store.find params[:id]
    end
    
    # If a record is not found, render the exception message.
    # I believe ErrorsController should handle this.
    def not_found(exception)
      render :json => { message: exception.message }, :status => :not_found
    end
end