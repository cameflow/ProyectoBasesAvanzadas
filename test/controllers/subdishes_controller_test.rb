require 'test_helper'

class SubdishesControllerTest < ActionController::TestCase
  setup do
    @subdish = subdishes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subdishes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subdish" do
    assert_difference('Subdish.count') do
      post :create, subdish: { amount: @subdish.amount, exp_date: @subdish.exp_date, name: @subdish.name }
    end

    assert_redirected_to subdish_path(assigns(:subdish))
  end

  test "should show subdish" do
    get :show, id: @subdish
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subdish
    assert_response :success
  end

  test "should update subdish" do
    patch :update, id: @subdish, subdish: { amount: @subdish.amount, exp_date: @subdish.exp_date, name: @subdish.name }
    assert_redirected_to subdish_path(assigns(:subdish))
  end

  test "should destroy subdish" do
    assert_difference('Subdish.count', -1) do
      delete :destroy, id: @subdish
    end

    assert_redirected_to subdishes_path
  end
end
