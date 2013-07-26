class StoresController < ApplicationController
  before_action :set_rest_options
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.all
    respond_with(@stores)
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
  end

  # GET /stores/new
  def new
    @store = Store.new
    respond_with(@store)
  end

  # GET /stores/1/edit
  def edit
    respond_with(@store)
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(store_params)
    flash[:notice] = 'Store was successfully created.' if @store.save
    respond_with(@store)
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    flash[:notice] = 'Store was successfully updated.'
    respond_with(@store)
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy
    respond_with(@store)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        @store = Store.new
        @rest_options[:success] = false
        @rest_options[:error_code] = 404
        @rest_options[:error_message] = "Store not found"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:name, :address)
    end
end
