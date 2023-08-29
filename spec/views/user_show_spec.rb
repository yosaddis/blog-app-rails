require 'rails_helper'


RSpec.describe 'users/index', type: :feature do

    before(:each) do
    @user = User.create(name: 'Yoseph Addisu', photo: 'https://i.pravatar.cc/300',
                        bio: 'Software Eng.', posts_counter: 0)
    5.times do |i|
      Post.create(title: "Post - #{i}", text: "This is the ##{i} post",
                  comments_counter: 0, likes_counter: 0, author_id: @user.id)
    end
    visit user_show_path(id: @user.id)
  end

  it 'displays user profile photo' do
    expect(page).to have_css("img[src*='https://i.pravatar.cc/300']")
  end

  it 'displays username' do
    expect(page).to have_content(@user.name)
  end

  it 'displays number of posts' do
    expect(page).to have_content('Number of Posts 5')
  end

  it "displays the user's last 3 posts" do
    expect(page).to have_content('Post - 4')
    expect(page).to have_content('Post - 3')
    expect(page).to have_content('Post - 2')
  end

  it 'displays the user bio' do
    expect(page).to have_content('Software Eng.')
  end

  it 'displays a button to see all posts' do
    expect(page).to have_content('See all posts')
  end

  it 'show all the user posts when the button is clicked' do
    click_on 'See all posts'
    expect(page).to have_content('Post - 0')
    expect(page).to have_content('Post - 1')
    expect(page).to have_content('Post - 2')
    expect(page).to have_content('Post - 3')
    expect(page).to have_content('Post - 4')
  end

  it 'Redirects to the user posts index page when clicking See all posts' do
    click_on 'See all posts'
    visit user_posts_path(@user.id)
    expect(page).to have_current_path(user_posts_path(@user.id))
  end

  it 'Redirects to the post show page when clicking on a post title' do
    #click_on 'See all posts'
    click_link("See all posts")
    expect(page).to have_current_path(user_posts_path(@user.id))
  end

end