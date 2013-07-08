require 'spec_helper'

feature 'Spree Admin Users Controller Export CSV' do
  stub_authorization!

  given!(:users) { create_list(:user, 2) }

  background do
    sign_in_as!(create(:admin_user))
    visit spree.admin_path
    click_link "Users"
  end

  scenario "Clicking export" do
    click_link "export_csv"
    expect(page).to have_content(users.first.email)
    expect(page).to have_content(users.first.id.to_s)
    expect(page).to have_content(users.first.login)
  end
end

