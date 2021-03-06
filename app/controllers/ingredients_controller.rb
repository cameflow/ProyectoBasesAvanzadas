class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]
  before_action :require_chef, only: [:new, :create,:edit ,:update, :destroy]
  before_action :require_chef_cook, only: [:shop]

  # GET /ingredients
  # GET /ingredients.json
  def index
    @ingredients = Ingredient.all
  end

  # GET /ingredients/1
  # GET /ingredients/1.json
  def show
  end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit
  end

  # POST /ingredients
  # POST /ingredients.json
  def create
    @ingredient = Ingredient.new(ingredient_params)

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully created.' }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredients/1
  # PATCH/PUT /ingredients/1.json
  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully updated.' }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def shop
    @ingredient = Ingredient.find_by(name: params[:nom])
    todaydat = Date.today
    expdate = (todaydat+3).to_s
    @sing = Subingredient.new(name: params[:nom],exp_date: expdate, amount:1)
    respond_to do |format|
      if @sing.save
        rel = InStock.create(from_node: @ingredient, to_node: @sing, isActive: true)
        format.html { redirect_to ingredients_path, notice: 'Ingredient was shopped.' }
        format.json { render :show, status: :created, location: @sing }
      else
        format.html { render :n }
        format.json { render json: @sing.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.json
  def destroy
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to ingredients_url, notice: 'Ingredient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :cost)
    end

    def require_login
      if !logged_in?
        redirect_to root_path
      end
    end

    def require_chef
      if current_user.role != 1
        redirect_to root_path
      end
    end

    def require_chef_cook
      if current_user.role != 1 && current_user.role !=2
        redirect_to root_path
      end
    end

end
