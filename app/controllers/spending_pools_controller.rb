class SpendingPoolsController < ApplicationController
  before_action :set_spending_pool, only: [:show, :edit, :update, :destroy]

  # GET /spending_pools
  # GET /spending_pools.json
  def index
    @spending_pools = SpendingPool.all
  end

  # GET /spending_pools/1
  # GET /spending_pools/1.json
  def show
  end

  # GET /spending_pools/new
  def new
    @spending_pool = SpendingPool.new
  end

  # GET /spending_pools/1/edit
  def edit
  end

  # POST /spending_pools
  # POST /spending_pools.json
  def create
    @spending_pool = SpendingPool.new(spending_pool_params)

    respond_to do |format|
      if @spending_pool.save
        format.html { redirect_to @spending_pool, notice: 'Spending pool was successfully created.' }
        format.json { render action: 'show', status: :created, location: @spending_pool }
      else
        format.html { render action: 'new' }
        format.json { render json: @spending_pool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spending_pools/1
  # PATCH/PUT /spending_pools/1.json
  def update
    respond_to do |format|
      if @spending_pool.update(spending_pool_params)
        format.html { redirect_to @spending_pool, notice: 'Spending pool was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @spending_pool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spending_pools/1
  # DELETE /spending_pools/1.json
  def destroy
    @spending_pool.destroy
    respond_to do |format|
      format.html { redirect_to spending_pools_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spending_pool
      @spending_pool = SpendingPool.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spending_pool_params
      params.require(:spending_pool).permit(:source, :amount, :description, :received_on, :event_id)
    end
end
