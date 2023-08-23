class Tone < ApplicationRecord
  # belongs_to :brand
  has_many :texts, through: :brand

  def to_prompt
    base = "politeness is a #{politeness} out of 10, verbosity is a #{verbosity} out of 10 humor is a #{humor} out of 10."
    base << 'Use poetic qualities.' if poetic
    base << 'Use sci-fi material.' if sci_fi
    base
  end
end
