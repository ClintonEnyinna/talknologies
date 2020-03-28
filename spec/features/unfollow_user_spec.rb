require 'rails_helper'

RSpec.feature 'UnfollowUsers', type: :feature do
  let(:user1) do
    User.create(fullname: 'user one',
                username: 'user1')
  end
  let(:user2) do
    User.create(fullname: 'user two',
                username: 'user2')
  end

  scenario 'User unfollows friend' do
    user2
    log_in(user1)
    send_request
    click_button('UNFOLLOW')
    expect(page).to have_selector(:link_or_button, 'FOLLOW')
    visit user_path(user1)
    expect(page).to have_content('0')
  end

  def send_request
    visit user_path(user2)
    expect(page).to have_content('user2')
    click_button('FOLLOW')
    expect(page).to have_selector(:link_or_button, 'UNFOLLOW')
  end

  def log_in(user)
    visit login_path
    fill_in 'Username', with: user.username
    click_button 'Log in'
  end

  def log_out
    click_link('ACCOUNT')
    click_link('LOG OUT')
  end
end
