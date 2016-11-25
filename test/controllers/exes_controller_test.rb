require 'test_helper'

class ExesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ex = exes(:one)
  end

  test "should get index" do
    get exes_url
    assert_response :success
  end

  test "should get new" do
    get new_ex_url
    assert_response :success
  end

  test "should create ex" do
    assert_difference('Ex.count') do
      post exes_url, params: { ex: { description: @ex.description, name: @ex.name, note_gentilesse: @ex.note_gentilesse, note_humour: @ex.note_humour, note_sex: @ex.note_sex, numero: @ex.numero, point_negatif: @ex.point_negatif, point_positif: @ex.point_positif } }
    end

    assert_redirected_to ex_url(Ex.last)
  end

  test "should show ex" do
    get ex_url(@ex)
    assert_response :success
  end

  test "should get edit" do
    get edit_ex_url(@ex)
    assert_response :success
  end

  test "should update ex" do
    patch ex_url(@ex), params: { ex: { description: @ex.description, name: @ex.name, note_gentilesse: @ex.note_gentilesse, note_humour: @ex.note_humour, note_sex: @ex.note_sex, numero: @ex.numero, point_negatif: @ex.point_negatif, point_positif: @ex.point_positif } }
    assert_redirected_to ex_url(@ex)
  end

  test "should destroy ex" do
    assert_difference('Ex.count', -1) do
      delete ex_url(@ex)
    end

    assert_redirected_to exes_url
  end
end
