class Tag < ApplicationRecord
    has_many :gossip_and_tags
    has_many :gossips, through: :gossip_and_tags
end
