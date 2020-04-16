require 'rails_helper'

RSpec.feature 'Tweets', type: :feature do
  let(:user1) do
    User.create(fullname: 'user one',
                username: 'user1')
  end

  scenario 'User makes a tweet' do
    log_in(user1)
    fill_in 'opinion_text', with: 'This is a test'
    page.execute_script("$('form').submit()")
    expect(page).to have_content('This is a test')
  end

  def log_in(user)
    visit login_path
    fill_in 'Username', with: user.username
    click_button 'Log in'
  end
end
