class Tone < ApplicationRecord
  belongs_to :brand
  has_many :texts, through: :brand
end
