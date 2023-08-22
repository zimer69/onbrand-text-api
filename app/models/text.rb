class Text < ApplicationRecord
  belongs_to :brand
  belongs_to :tone, through: :brand
  belongs_to :prompt
end
