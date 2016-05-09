require 'test_helper'

class SubingredientsControllerTest < ActionController::TestCase
  setup do
    @subingredient = subingredients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subingredients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subingredient" do
    assert_difference('Subingredient.count') do
      post :create, subingredient: { amount: @subingredient.amount, exp_date: @subingredient.exp_date, name: @subingredient.name }
    end

    assert_redirected_to subingredient_path(assigns(:subingredient))
  end

  test "should show subingredient" do
    get :show, id: @subingredient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subingredient
    assert_response :success
  end

  test "should update subingredient" do
    patch :update, id: @subingredient, subingredient: { amount: @subingredient.amount, exp_date: @subingredient.exp_date, name: @subingredient.name }
    assert_redirected_to subingredient_path(assigns(:subingredient))
  end

  test "should destroy subingredient" do
    assert_difference('Subingredient.count', -1) do
      delete :destroy, id: @subingredient
    end

    assert_redirected_to subingredients_path
  end
end
