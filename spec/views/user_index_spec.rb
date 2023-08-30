require 'rails_helper'

RSpec.describe 'users/index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Yoseph Addisu', photo: 'https://i.pravatar.cc/300', bio: 'Software Eng',
                        posts_counter: 1)
    @user1 = User.create(name: 'Giancarlo Dumani', photo: 'https://i.pravatar.cc/300', bio: 'Software Eng',
                         posts_counter: 3)
    visit '/'
  end

  it 'displays username' do
    expect(page).to have_content(@user.name)
    expect(page).to have_content(@user1.name)
  end

  it 'displays number of user posts' do
    expect(page).to have_content('Number of Posts: 1')
    expect(page).to have_content('Number of Posts: 3')
  end

  it 'displays users profile picture' do
    expect(page).to have_css("img[src*='https://i.pravatar.cc/300']")
  end
end
