require 'spec_helper'

feature 'Spree Admin Orders Controller Export CSV' do
  stub_authorization!

  given!(:nope_orders) { create_list(:completed_order_with_totals, 2) }
  given!(:yep_orders) { create_list(:order_ready_to_ship, 2) }
  given!(:nope_order) { nope_orders.first }
  given!(:yep_order) { yep_orders.first }

  background do
    sign_in_as!(create(:admin_user))
    visit spree.admin_path
    click_link "Orders"
  end

  scenario "Without a params[:created_at_gt] && params[:created_at_lt]" do
    expect(page).to_not have_link("export_csv")
  end

  context "With a date range" do
    given!(:last_week_order) { create(:order_ready_to_ship, completed_at: 1.week.ago.in_time_zone) }
    given!(:yesterday_order) { create(:order_ready_to_ship, completed_at: 1.day.ago.in_time_zone) }
    given!(:today_order) { create(:order_ready_to_ship) }

    background do
      fill_in "q_created_at_gt", with: Time.zone.today.strftime("%Y/%m/%d")
      fill_in "q_created_at_lt", with: Time.zone.today.strftime("%Y/%m/%d")
      click_button "Filter Results"
    end

    scenario "With orders only today" do
      click_link "export_csv"
      expect(page).to have_content(today_order.number)
      expect(page).to_not have_content(last_week_order.number)
      expect(page).to_not have_content(yesterday_order.number)
    end

    scenario "Clicking export" do
      click_link "export_csv"
      expect(page).to have_content(yep_order.number)
    end

    scenario "Only include orders ready to ship" do
      click_link "export_csv"
      expect(page).to_not have_content(nope_order.number)
    end
  end
end
