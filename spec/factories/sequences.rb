FactoryBot.define do
  sequence(:city) do |n|
    "Test_#{n}"
  end
end