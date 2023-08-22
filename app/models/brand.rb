class Brand < ApplicationRecord
  has_many :tones
  has_many :texts
  has_many :prompts
end
