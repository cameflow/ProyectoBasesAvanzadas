class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:new, :create, :edit,:update]
  before_action :require_chef, except: [:orders,:delivers,:registerc,:new, :create,:edit,:update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end


  def orders
    @orders = current_user.orders
    @dishes = Dish.all
    total = 0.0
    for order in @orders
      total = total + @dishes.find_by(name: order.name).cost
    end
    @dinero = total
  end

  def delivers
    @orders = current_user.orders.where(delivered:true)
    @dishes = Dish.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :role ,:password)
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

end
