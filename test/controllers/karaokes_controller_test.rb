require 'test_helper'

class KaraokesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should get index" do
    get "/"
    assert_response :success
    assert_select "title", "Karaokefinder"
  end
end
