require File.dirname(__FILE__) + '/../test_helper'

class TriggersControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:triggers)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_trigger
    assert_difference('Trigger.count') do
      post :create, :trigger => { }
    end

    assert_redirected_to trigger_path(assigns(:trigger))
  end

  def test_should_show_trigger
    get :show, :id => triggers(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => triggers(:one).id
    assert_response :success
  end

  def test_should_update_trigger
    put :update, :id => triggers(:one).id, :trigger => { }
    assert_redirected_to trigger_path(assigns(:trigger))
  end

  def test_should_destroy_trigger
    assert_difference('Trigger.count', -1) do
      delete :destroy, :id => triggers(:one).id
    end

    assert_redirected_to triggers_path
  end
end
