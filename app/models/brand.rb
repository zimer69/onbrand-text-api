class Brand < ApplicationRecord
  has_many :tones
  has_many :texts
end
