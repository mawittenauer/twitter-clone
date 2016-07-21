Fabricator(:user) do
  email { Faker::Internet.email }
  tag { Faker::Lorem.word }
  password { 'password' }
end
