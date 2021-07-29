class Post < ApplicationRecord
  validates :content, presence: true, allow_blank: false, allow_nil: false, length: {
    minimum: 1,
    maximum: 140,
    too_short: "%{count} characters is too short. Enter at least 1 character.",
    too_long: "%{count} characters is the maximum allowed"
  }
end
