FactoryGirl.define do
  factory :link do
    sequence :url do |n|
      "http://url#{n}.com"
    end
  end
end
