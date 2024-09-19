class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :recommender, class_name: "User"
end
