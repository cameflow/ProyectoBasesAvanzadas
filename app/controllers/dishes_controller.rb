class DishesController < ApplicationController
    before_action :set_dish, only: [:show, :edit, :update, :destroy]
    before_action :require_login, except: [:index, :show]
    before_action :require_chef, only: [:new, :create,:edit ,:update, :destroy]
    before_action :require_chef_cook, only: [:create_sub]

  # GET /dishes
  # GET /dishes.json
  def index
    @dishes = Dish.all
  end

  # GET /dishes/1
  # GET /dishes/1.json
  def show
  end

  # GET /dishes/new
  def new
    @dish = Dish.new
  end

  # GET /dishes/1/edit
  def edit
  end

  # POST /dishes
  # POST /dishes.json
  def create
    @dish = Dish.new(dish_params)

    respond_to do |format|
      if @dish.save
        format.html { redirect_to @dish, notice: 'Dish was successfully created.' }
        format.json { render :show, status: :created, location: @dish }
      else
        format.html { render :new }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dishes/1
  # PATCH/PUT /dishes/1.json
  def update
    respond_to do |format|
      if @dish.update(dish_params)
        format.html { redirect_to @dish, notice: 'Dish was successfully updated.' }
        format.json { render :show, status: :ok, location: @dish }
      else
        format.html { render :edit }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_sub
    @dish = Dish.find_by(name: params[:nom])
    todaydat = Date.today
    expdate = (todaydat+2).to_s
    @sub = Subdish.new(name: params[:nom],exp_date: expdate, amount:1)
    respond_to do |format|
      if @sub.save
        rel = InDishStock.create(from_node: @dish, to_node: @sub, isActive: true)
        format.html { redirect_to dishes_path, notice: 'Dish was successfully ordered.' }
        format.json { render :show, status: :created, location: @sub }
      else
        format.html { render :n }
        format.json { render json: @sub.errors, status: :unprocessable_entity }
      end
    end
  end


  def order
    @dish = Dish.find_by(name: params[:nom])
    todaydat = Date.today
    @order = Order.new(name: params[:nom], created: todaydat)
    respond_to do |format|
      if @order.save
        @dish.orders << @order
        current_user.orders << @order
        format.html { redirect_to dishes_path, notice: 'Dish was successfully made.' }
        format.json { render :show, status: :created, location: @sub }
      else
        format.html { render :n }
        format.json { render json: @sub.errors, status: :unprocessable_entity }
      end
    end


  end


  # DELETE /dishes/1
  # DELETE /dishes/1.json
  def destroy
    @dish.destroy
    respond_to do |format|
      format.html { redirect_to dishes_url, notice: 'Dish was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dish_params
      params.require(:dish).permit(:name, :cost)
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
