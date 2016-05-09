class SubingredientsController < ApplicationController
  before_action :set_subingredient, only: [:show, :edit, :update, :destroy]

  # GET /subingredients
  # GET /subingredients.json
  def index
    @subingredients = Subingredient.all
  end

  # GET /subingredients/1
  # GET /subingredients/1.json
  def show
  end

  # GET /subingredients/new
  def new
    @subingredient = Subingredient.new
  end

  # GET /subingredients/1/edit
  def edit
  end

  # POST /subingredients
  # POST /subingredients.json
  def create
    @subingredient = Subingredient.new(subingredient_params)

    respond_to do |format|
      if @subingredient.save
        format.html { redirect_to @subingredient, notice: 'Subingredient was successfully created.' }
        format.json { render :show, status: :created, location: @subingredient }
      else
        format.html { render :new }
        format.json { render json: @subingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subingredients/1
  # PATCH/PUT /subingredients/1.json
  def update
    respond_to do |format|
      if @subingredient.update(subingredient_params)
        format.html { redirect_to @subingredient, notice: 'Subingredient was successfully updated.' }
        format.json { render :show, status: :ok, location: @subingredient }
      else
        format.html { render :edit }
        format.json { render json: @subingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subingredients/1
  # DELETE /subingredients/1.json
  def destroy
    @subingredient.destroy
    respond_to do |format|
      format.html { redirect_to subingredients_url, notice: 'Subingredient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subingredient
      @subingredient = Subingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subingredient_params
      params.require(:subingredient).permit(:name, :amount, :exp_date)
    end
end
