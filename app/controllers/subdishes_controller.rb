class SubdishesController < ApplicationController
  before_action :set_subdish, only: [:show, :edit, :update, :destroy]

  # GET /subdishes
  # GET /subdishes.json
  def index
    @subdishes = Subdish.all
  end

  # GET /subdishes/1
  # GET /subdishes/1.json
  def show
  end

  # GET /subdishes/new
  def new
    @subdish = Subdish.new
  end

  # GET /subdishes/1/edit
  def edit
  end

  # POST /subdishes
  # POST /subdishes.json
  def create
    @subdish = Subdish.new(subdish_params)

    respond_to do |format|
      if @subdish.save
        format.html { redirect_to @subdish, notice: 'Subdish was successfully created.' }
        format.json { render :show, status: :created, location: @subdish }
      else
        format.html { render :new }
        format.json { render json: @subdish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subdishes/1
  # PATCH/PUT /subdishes/1.json
  def update
    respond_to do |format|
      if @subdish.update(subdish_params)
        format.html { redirect_to @subdish, notice: 'Subdish was successfully updated.' }
        format.json { render :show, status: :ok, location: @subdish }
      else
        format.html { render :edit }
        format.json { render json: @subdish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subdishes/1
  # DELETE /subdishes/1.json
  def destroy
    @subdish.destroy
    respond_to do |format|
      format.html { redirect_to subdishes_url, notice: 'Subdish was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subdish
      @subdish = Subdish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subdish_params
      params.require(:subdish).permit(:name, :amount, :exp_date)
    end
end
