require 'test_helper'

class BinnaclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @binnacle = binnacles(:one)
  end

  test "should get index" do
    get binnacles_url, as: :json
    assert_response :success
  end

  test "should create binnacle" do
    assert_difference('Binnacle.count') do
      post binnacles_url, params: { binnacle: { asunto: @binnacle.asunto, dia: @binnacle.dia, hora: @binnacle.hora, q_se_iso: @binnacle.q_se_iso } }, as: :json
    end

    assert_response 201
  end

  test "should show binnacle" do
    get binnacle_url(@binnacle), as: :json
    assert_response :success
  end

  test "should update binnacle" do
    patch binnacle_url(@binnacle), params: { binnacle: { asunto: @binnacle.asunto, dia: @binnacle.dia, hora: @binnacle.hora, q_se_iso: @binnacle.q_se_iso } }, as: :json
    assert_response 200
  end

  test "should destroy binnacle" do
    assert_difference('Binnacle.count', -1) do
      delete binnacle_url(@binnacle), as: :json
    end

    assert_response 204
  end
end
