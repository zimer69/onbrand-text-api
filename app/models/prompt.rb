class Prompt < ApplicationRecord
  belongs_to :brand
  has_many :tones
  has_many :texts
end
