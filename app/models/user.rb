class User < ApplicationRecord

     # validates :email,
    #presence: true,
    #uniqueness: true,
    #format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "valid email adress please" }
  #validates :first_name,
     # presence: true
  #validates :last_name,
     # presence: true
  #validates :age,
     # presence: true
  #validates :description,
     # presence: true
  #validates :password,
     # presence: true, length: { minimum: 6 }


    belongs_to :city, optional: true
    has_many :comments
    has_many :gossips
    has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
    has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
    has_secure_password
end