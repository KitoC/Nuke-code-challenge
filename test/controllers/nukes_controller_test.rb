require 'test_helper'

class NukesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nuke = nukes(:one)
  end

  test "should get index" do
    get nukes_url
    assert_response :success
  end

  test "should get new" do
    get new_nuke_url
    assert_response :success
  end

  test "should create nuke" do
    assert_difference('Nuke.count') do
      post nukes_url, params: { nuke: { nuke_code: @nuke.nuke_code } }
    end

    assert_redirected_to nuke_url(Nuke.last)
  end

  test "should show nuke" do
    get nuke_url(@nuke)
    assert_response :success
  end

  test "should get edit" do
    get edit_nuke_url(@nuke)
    assert_response :success
  end

  test "should update nuke" do
    patch nuke_url(@nuke), params: { nuke: { nuke_code: @nuke.nuke_code } }
    assert_redirected_to nuke_url(@nuke)
  end

  test "should destroy nuke" do
    assert_difference('Nuke.count', -1) do
      delete nuke_url(@nuke)
    end

    assert_redirected_to nukes_url
  end
end
