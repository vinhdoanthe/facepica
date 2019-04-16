require "application_system_test_case"

class AuthorizedClientsTest < ApplicationSystemTestCase
  setup do
    @authorized_client = authorized_clients(:one)
  end

  test "visiting the index" do
    visit authorized_clients_url
    assert_selector "h1", text: "Authorized Clients"
  end

  test "creating a Authorized client" do
    visit authorized_clients_url
    click_on "New Authorized Client"

    fill_in "Client name", with: @authorized_client.client_name
    fill_in "Client secret", with: @authorized_client.client_secret
    fill_in "Location", with: @authorized_client.location
    click_on "Create Authorized client"

    assert_text "Authorized client was successfully created"
    click_on "Back"
  end

  test "updating a Authorized client" do
    visit authorized_clients_url
    click_on "Edit", match: :first

    fill_in "Client name", with: @authorized_client.client_name
    fill_in "Client secret", with: @authorized_client.client_secret
    fill_in "Location", with: @authorized_client.location
    click_on "Update Authorized client"

    assert_text "Authorized client was successfully updated"
    click_on "Back"
  end

  test "destroying a Authorized client" do
    visit authorized_clients_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Authorized client was successfully destroyed"
  end
end
