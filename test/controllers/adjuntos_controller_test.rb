require 'test_helper'

class AdjuntosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adjunto = adjuntos(:one)
  end

  test "should get index" do
    get adjuntos_url
    assert_response :success
  end

  test "should get new" do
    get new_adjunto_url
    assert_response :success
  end

  test "should create adjunto" do
    assert_difference('Adjunto.count') do
      post adjuntos_url, params: { adjunto: {  } }
    end

    assert_redirected_to adjunto_url(Adjunto.last)
  end

  test "should show adjunto" do
    get adjunto_url(@adjunto)
    assert_response :success
  end

  test "should get edit" do
    get edit_adjunto_url(@adjunto)
    assert_response :success
  end

  test "should update adjunto" do
    patch adjunto_url(@adjunto), params: { adjunto: {  } }
    assert_redirected_to adjunto_url(@adjunto)
  end

  test "should destroy adjunto" do
    assert_difference('Adjunto.count', -1) do
      delete adjunto_url(@adjunto)
    end

    assert_redirected_to adjuntos_url
  end
end
