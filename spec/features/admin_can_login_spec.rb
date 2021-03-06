require 'rails_helper'

feature "When an admin logs in" do
  scenario "they are redirected to the admin/dashboard page" do
    user = create(:user)
    user.update(role: 1)

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    within(".user-form") do
      click_on("Login")
    end

    expect(current_path).to eq('/admin/dashboard')
    expect(page).to have_content('Admin Dashboard')
  end

  scenario "they see an error message if they type in wrong info" do
    user = create(:user)
    user.update(role: 1)

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "thisiswrong"
    within(".user-form") do
      click_on("Login")
    end

    expect(page).to have_content("login unsuccessful")
    expect(current_path).to eq(login_path)
  end
end
