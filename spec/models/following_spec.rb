require 'rails_helper'

RSpec.describe Following, type: :model do
  describe 'friendship' do
    let(:user1) do
      User.create(fullname: 'user one',
                  username: 'user1')
    end
    let(:user2) do
      User.create(fullname: 'user two',
                  username: 'user2')
    end

    let(:follow) { Following.create(follower_id: user1.id, followed_id: user2.id) }

    it 'user has follower' do
      expect(user2.followers.first).to eq(User.find_by(username: 'user1'))
    end

    it 'user follows' do
      expect(user1.followees.first).to eq(User.find_by(username: 'user2'))
    end
  end
end
