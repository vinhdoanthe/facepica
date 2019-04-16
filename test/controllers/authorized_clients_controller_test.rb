require 'test_helper'

class AuthorizedClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @authorized_client = authorized_clients(:one)
  end

  test "should get index" do
    get authorized_clients_url
    assert_response :success
  end

  test "should get new" do
    get new_authorized_client_url
    assert_response :success
  end

  test "should create authorized_client" do
    assert_difference('AuthorizedClient.count') do
      post authorized_clients_url, params: { authorized_client: { client_name: @authorized_client.client_name, client_secret: @authorized_client.client_secret, location: @authorized_client.location } }
    end

    assert_redirected_to authorized_client_url(AuthorizedClient.last)
  end

  test "should show authorized_client" do
    get authorized_client_url(@authorized_client)
    assert_response :success
  end

  test "should get edit" do
    get edit_authorized_client_url(@authorized_client)
    assert_response :success
  end

  test "should update authorized_client" do
    patch authorized_client_url(@authorized_client), params: { authorized_client: { client_name: @authorized_client.client_name, client_secret: @authorized_client.client_secret, location: @authorized_client.location } }
    assert_redirected_to authorized_client_url(@authorized_client)
  end

  test "should destroy authorized_client" do
    assert_difference('AuthorizedClient.count', -1) do
      delete authorized_client_url(@authorized_client)
    end

    assert_redirected_to authorized_clients_url
  end
end
