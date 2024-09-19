require 'test_helper'

class GreetingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get greetings_url
    assert_response :success
  end

  test "should create greeting" do
    assert_difference('Greeting.count') do
      post greetings_url, params: { greeting: { message: 'Hello, World!' } }
    end

    assert_redirected_to greeting_url(Greeting.last)
  end
end
