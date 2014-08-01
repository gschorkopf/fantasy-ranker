class Player < ActiveRecord::Base
  validates :nerd_id, uniqueness: true
end
