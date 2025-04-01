class ListRole < ApplicationRecord
  belongs_to :list
  belongs_to :role
end
