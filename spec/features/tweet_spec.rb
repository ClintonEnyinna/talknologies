require 'rails_helper'

RSpec.feature "Tweets", type: :feature do
  let(:user1) do
    User.create(fullname: 'user one',
                username: 'user1')
  end

  def submit
    form = find("form")
    Capybara::RackTest::Form.new(page.driver, form.native).submit({})
  end

  scenario 'User makes a tweet' do
    log_in(user1)
    fill_in 'opinion_text', with: "This is a test"
    submit
    expect(page).to have_content("This is a test")
  end

  def log_in(user)
    visit login_path
    fill_in 'Username', with: user.username
    click_button 'Log in'
  end
end


