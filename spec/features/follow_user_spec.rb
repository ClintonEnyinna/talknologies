require 'rails_helper'

RSpec.feature 'FollowUsers', type: :feature do
  let(:user1) do
    User.create(fullname: 'user one',
                username: 'user1')
  end
  let(:user2) do
    User.create(fullname: 'user two',
                username: 'user2')
  end

  scenario 'User sends friend request' do
    user2
    log_in(user1)
    send_request
    click_link('Log out')
    log_in(user2)
    visit user_path(user2)
    expect(page).to have_content('1')
    expect(page).to have_content('user one')
  end

  def send_request
    visit user_path(user2)
    expect(page).to have_content('user2')
    click_button('Follow')
    expect(page).to have_selector(:link_or_button, 'Unfollow')
  end

  def log_in(user)
    visit login_path
    fill_in 'Username', with: user.username
    click_button 'Log in'
  end
end
