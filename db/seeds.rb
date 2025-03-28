# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
admin = User.create!(
  username: "admin",
  email: "admin@example.com",
  password: "password",
  password_confirmation: "password",
  admin: true
)

admin.profile.update(
  first_name: "Admin",
  last_name: "User",
  bio: "I am the administrator of this blog platform."
)

# Create regular users
user1 = User.create!(
  username: "johndoe",
  email: "john@example.com",
  password: "password",
  password_confirmation: "password"
)

user1.profile.update(
  first_name: "John",
  last_name: "Doe",
  bio: "I'm a tech enthusiast and love writing about new technologies.",
  date_of_birth: Date.new(1990, 5, 15)
)

user2 = User.create!(
  username: "janesmith",
  email: "jane@example.com",
  password: "password",
  password_confirmation: "password"
)

user2.profile.update(
  first_name: "Jane",
  last_name: "Smith",
  bio: "Professional writer with a passion for travel and adventure.",
  date_of_birth: Date.new(1985, 8, 22)
)

# Create categories
tech = Category.create!(
  name: "Technology",
  description: "Posts about the latest technology trends, gadgets, and innovations."
)

travel = Category.create!(
  name: "Travel",
  description: "Explore the world through our travel guides and experiences."
)

food = Category.create!(
  name: "Food",
  description: "Recipes, cooking tips, and food adventures from around the world."
)

lifestyle = Category.create!(
  name: "Lifestyle",
  description: "Tips for healthy living, personal development, and everyday life."
)

# Create posts
post1 = user1.posts.create!(
  title: "The Future of Artificial Intelligence",
  content: "Artificial Intelligence (AI) is reshaping industries across the globe. From healthcare to finance, AI is improving efficiency and providing insights that were previously unattainable.\n\nMachine Learning algorithms continue to evolve, allowing computers to learn from data without being explicitly programmed. Deep Learning, a subset of Machine Learning, uses neural networks to analyze patterns in data, similar to how the human brain processes information.\n\nAs AI becomes more integrated into our daily lives, ethical considerations become increasingly important. Questions about privacy, bias, and the impact on jobs need to be addressed as we move forward with these technologies.",
  published: true
)
post1.categories << tech

post2 = user1.posts.create!(
  title: "Building Your First Ruby on Rails Application",
  content: "Ruby on Rails is a web application framework that follows the Model-View-Controller (MVC) pattern. It emphasizes convention over configuration, making it easy to get started with web development.\n\nTo create your first Rails application, you'll need to install Ruby and the Rails gem. Once installed, you can generate a new application with the 'rails new' command, followed by the name of your application.\n\nRails provides a powerful set of tools for building web applications, including database migrations, scaffolding, and an extensive set of helper methods. It also emphasizes RESTful design and the Don't Repeat Yourself (DRY) principle.",
  published: true
)
post2.categories << tech

post3 = user2.posts.create!(
  title: "10 Must-Visit Destinations in Europe",
  content: "Europe offers a rich tapestry of cultures, languages, and landscapes. From the romantic streets of Paris to the historic ruins of Rome, there's something for every traveler.\n\n1. Paris, France - Known as the 'City of Light,' Paris offers iconic landmarks like the Eiffel Tower and Louvre Museum.\n\n2. Rome, Italy - Explore the Colosseum, Roman Forum, and Vatican City in this historic capital.\n\n3. Barcelona, Spain - Famous for its unique architecture by Antoni Gaudí, including the Sagrada Familia.\n\n4. Amsterdam, Netherlands - Canals, museums, and a vibrant cultural scene make this a must-visit destination.\n\n5. Prague, Czech Republic - Walk through the charming Old Town and cross the historic Charles Bridge.\n\n6. Santorini, Greece - Stunning views of the Aegean Sea from whitewashed cliffside towns.\n\n7. Vienna, Austria - A city of music, art, and imperial palaces.\n\n8. Budapest, Hungary - Known for its thermal baths, historic buildings, and vibrant nightlife.\n\n9. Dubrovnik, Croatia - A walled city on the Adriatic coast with stunning architecture.\n\n10. Edinburgh, Scotland - Explore the medieval Old Town and Georgian New Town in this historic city.",
  published: true
)
post3.categories << travel

post4 = user2.posts.create!(
  title: "Easy Mediterranean Diet Recipes",
  content: "The Mediterranean diet is known for its health benefits, including reduced risk of heart disease and improved cognitive function. It emphasizes fruits, vegetables, whole grains, legumes, and healthy fats.\n\nGreek Salad Recipe:\n- 2 tomatoes, diced\n- 1 cucumber, sliced\n- 1 red onion, thinly sliced\n- 1 bell pepper, chopped\n- 200g feta cheese, cubed\n- Kalamata olives\n- Extra virgin olive oil\n- Red wine vinegar\n- Dried oregano\n- Salt and pepper to taste\n\nSimply combine all ingredients in a bowl, drizzle with olive oil and vinegar, and season with oregano, salt, and pepper.\n\nHummus Recipe:\n- 1 can chickpeas, drained and rinsed\n- 2 tablespoons tahini\n- 2 cloves garlic\n- Juice of 1 lemon\n- 2 tablespoons olive oil\n- Salt to taste\n- Paprika for garnish\n\nBlend all ingredients in a food processor until smooth. Adjust consistency with water if needed.",
  published: true
)
post4.categories << food

post5 = admin.posts.create!(
  title: "Mindfulness Techniques for Busy Professionals",
  content: "In today's fast-paced world, finding moments of peace can be challenging. Mindfulness offers techniques to help center yourself and reduce stress, even with a busy schedule.\n\nOne-Minute Breathing Exercise:\nTake a minute to focus solely on your breath. Breathe in deeply through your nose for four counts, hold for two, and exhale through your mouth for six counts. This quick exercise can be done anywhere, anytime.\n\nMindful Walking:\nTransform your daily walk into a mindfulness practice. Pay attention to each step, the feeling of your feet touching the ground, and the sensations in your body as you move.\n\nBody Scan Meditation:\nTake a few minutes to mentally scan your body from head to toe, noticing any tension or discomfort. This practice helps you become more aware of your physical state and can guide you in releasing tension.\n\nGratitude Practice:\nEnd each day by noting three things you're grateful for. This shifts your focus from what's lacking to what's abundant in your life.",
  published: true
)
post5.categories << lifestyle

# Create comments
Comment.create!(
  user: user2,
  post: post1,
  content: "This is a fascinating topic! I'd love to see more about how AI is being used in healthcare specifically."
)

Comment.create!(
  user: admin,
  post: post1,
  content: "Great overview of AI applications. The ethical considerations you mentioned are crucial as we continue to advance these technologies."
)

Comment.create!(
  user: user1,
  post: post3,
  content: "I've visited Barcelona and Prague from your list, and they were both amazing! I'd add Budapest to my must-visit list based on your recommendation."
)

Comment.create!(
  user: admin,
  post: post4,
  content: "I tried your hummus recipe, and it was delicious! I added a bit of cumin for extra flavor."
)

Comment.create!(
  user: user2,
  post: post5,
  content: "The one-minute breathing exercise has been a game-changer for me during stressful workdays. Simple but effective!"
)

puts "Seed data created successfully!"