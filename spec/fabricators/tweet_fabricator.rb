Fabricator(:tweet) do
  body { Faker::Lorem.words(3).join(' ') }
end
