class Services::StoresController < Services::BaseController
  
  # GET /stores
  def index
    @stores = Store.all
  end
  
end