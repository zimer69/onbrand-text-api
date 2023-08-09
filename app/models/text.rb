class Text < ApplicationRecord
  belongs_to :brand
  belongs_to :tone, through: :brand
end
