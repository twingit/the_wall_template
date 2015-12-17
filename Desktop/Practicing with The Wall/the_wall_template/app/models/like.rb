class Like < ActiveRecord::Base

  belongs_to :user
  belongs_to :parent, polymorphic: true

  validates :parent, presence: true # Necessary?
  validates :user, presence: true, uniqueness: {scope: [:parent_id, :parent_type]}
  
end
