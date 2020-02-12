class Gossip < ApplicationRecord
    validates :title,
    presence: true,
    length: { minimum: 3, maximum: 140}
    validates :content,
    presence: true,
    length: { minimum: 2 }
    belongs_to :user
    has_many :comments
    has_many :gossip_and_tags
    has_many :tags, through: :gossip_and_tags
end
