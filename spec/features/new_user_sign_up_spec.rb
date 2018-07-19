require 'rails_helper'

RSpec.feature "Sign Up", :type => :feature do
  let(:test_user) {User.new(first_name: 'test', last_name: 'test', email: 'test@doe.com', password_digest: 'test')}

  scenario "New user signs up" do
    visit "/users/new"

    fill_in "First name", :with => "test"
    fill_in "Last name", :with => "test"
    fill_in "Email", :with => "t@test.com"
    fill_in "Password", :with => "test"
    fill_in "Password confirmation", :with => "test"
    click_button "Sign up!"

    expect(page).to have_text("Account created successfully!")
  end

  scenario 'User uses invalid email' do
  	test_user.save!
  	
  	visit "/users/new"

    fill_in "First name", :with => "Shawn"
    fill_in "Last name", :with => "Best"
    fill_in "Email", :with => "test@doe.com"
    fill_in "Password", :with => "test"
    fill_in "Password confirmation", :with => "test"
    click_button "Sign up!"

    expect(page).to have_text("Oops, couldn't create account. Please make sure you are using a valid email and password and try again.")
  end

end