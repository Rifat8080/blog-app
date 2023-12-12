# db/seeds.rb

require 'faker'

# Create users
10.times do
  User.create(
    name: Faker::Name.name,
    photo: Faker::Avatar.image,
    bio: Faker::Lorem.paragraph
  )
end

# Create posts with associated comments and likes
User.all.each do |user|
  5.times do
    post = user.posts.create(
      title: Faker::Lorem.sentence,
      text: Faker::Lorem.paragraphs.join('\n')
    )

    # Create comments for the post
    3.times do
      post.comments.create(
        author_id: User.pluck(:id).sample,
        text: Faker::Lorem.sentence
      )
    end

    # Create likes for the post
    2.times do
      post.likes.create(
        author_id: User.pluck(:id).sample
      )
    end
  end
end
