# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: 'Yoseph', photo: 'https://placekitten.com/200/201', bio: 'I am a software engineer.')
user2 = User.create(name: 'Endris', photo: 'https://placekitten.com/200/202', bio: 'I am an accountant.')
user3 = User.create(name: 'Kalkidan', photo: 'https://placekitten.com/200/203', bio: 'I am a doctor.')
user4 = User.create(name: 'Solomon', photo: 'https://placekitten.com/200/204', bio: 'I am a teacher.')
user5 = User.create(name: 'Wondi', photo: 'https://placekitten.com/200/205', bio: 'I am a nurse.')

post1 = Post.create(author_id: user1.id, title: 'Post Title One', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
post2 = Post.create(author_id: user1.id, title: 'Post Title Two', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
post3 = Post.create(author_id: user3.id, title: 'Post Title Three', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
post4 = Post.create(author_id: user2.id, title: 'Post Title Four', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
post5 = Post.create(author_id: user4.id, title: 'Post Title Five', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
post6 = Post.create(author_id: user3.id, title: 'Post Title Six', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
post7 = Post.create(author_id: user1.id, title: 'Post Title Seven', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')
post8 = Post.create(author_id: user1.id, title: 'Post Title Eight', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')

Comment.create(author_id: user1.id, post_id: post1.id, text: 'first comment.')
Comment.create(author_id: user1.id, post_id: post1.id, text: 'first comment.')
Comment.create(author_id: user1.id, post_id: post1.id, text: 'first comment.')
Comment.create(author_id: user1.id, post_id: post1.id, text: 'first comment.')
Comment.create(author_id: user1.id, post_id: post1.id, text: 'first comment.')
Comment.create(author_id: user1.id, post_id: post1.id, text: 'first comment.')
Comment.create(author_id: user1.id, post_id: post1.id, text: 'first comment.')
Comment.create(author_id: user1.id, post_id: post1.id, text: 'first comment.')
Comment.create(author_id: user1.id, post_id: post1.id, text: 'first comment.')
Comment.create(author_id: user1.id, post_id: post1.id, text: 'first comment.')

Comment.create(author_id: user4.id, post_id: post1.id, text: 'second comment.')
Comment.create(author_id: user5.id, post_id: post4.id, text: 'first comment.')
Comment.create(author_id: user4.id, post_id: post2.id, text: 'second comment.')
Comment.create(author_id: user5.id, post_id: post3.id, text: 'first comment.')

Like.create(author_id: user1.id, post_id: post1.id)
Like.create(author_id: user2.id, post_id: post2.id)
Like.create(author_id: user3.id, post_id: post3.id)
Like.create(author_id: user4.id, post_id: post4.id)
Like.create(author_id: user2.id, post_id: post5.id)
Like.create(author_id: user3.id, post_id: post6.id)
Like.create(author_id: user4.id, post_id: post7.id)
Like.create(author_id: user1.id, post_id: post8.id)



