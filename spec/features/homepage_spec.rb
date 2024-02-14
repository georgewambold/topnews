require "rails_helper"

describe "visiting the app's home page" do
  scenario "without logging in" do
    visit "/"

    expect(page).to have_content("You need to sign in or sign up before continuing")
  end

  scenario "after having logged in" do
    user = User.create!(email: "user@gmail.com", password: "password123")

    log_in(user)

    expect(page).to have_content("Signed in successfully")
    expect(page).to have_content("Welcome to Top News")
  end

  scenario "logging out" do
    visit "/"

    expect(page).not_to have_content("Sign out")

    user = User.create!(email: "user@gmail.com", password: "password123")

    log_in(user)

    expect(page).to have_content("Signed in successfully")

    click_on("Sign out")

    expect(page).to have_content("You need to sign in")
  end
end
