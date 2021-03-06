class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  respond_to :html

  # GET /stores
  def index
    @stores = Store.all
  end

  # GET /stores/1
  def show
  end

  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores
  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Store was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /stores/1
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'Store was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /stores/1
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:name, :address)
    end
end
