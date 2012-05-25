require 'test_helper'

class SpielsControllerTest < ActionController::TestCase
  setup do
    @spiel = spiels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:spiels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create spiel" do
    assert_difference('Spiel.count') do
      post :create, spiel: @spiel.attributes
    end

    assert_redirected_to spiel_path(assigns(:spiel))
  end

  test "should show spiel" do
    get :show, id: @spiel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @spiel
    assert_response :success
  end

  test "should update spiel" do
    put :update, id: @spiel, spiel: @spiel.attributes
    assert_redirected_to spiel_path(assigns(:spiel))
  end

  test "should destroy spiel" do
    assert_difference('Spiel.count', -1) do
      delete :destroy, id: @spiel
    end

    assert_redirected_to spiels_path
  end
end
