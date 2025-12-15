require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_path
    assert_response :success
  end

  test "should get help" do
    get help_path
    assert_response :success
  end

  test "should get about" do
    get about_path
    assert_response :success
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | Ruby on Rails Tutorial Sample App"
  end

  test 'should get sign in' do
    get sign_in_path
    assert_response :success
    assert_select "title", "Sign In | Ruby on Rails Tutorial Sample App"
  end

  test 'should get sign up' do
    get sign_up_path
    assert_response :success
    assert_select "title", "Sign Up | Ruby on Rails Tutorial Sample App"
  end
end
