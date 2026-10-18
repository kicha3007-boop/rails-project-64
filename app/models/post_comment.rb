class PostComment < ApplicationRecord
  has_ancestry ancestry_format: :materialized_path2

  belongs_to :user
  belongs_to :post

  validates :content, presence: true, length: { minimum: 5, maximum: 400 }
end
