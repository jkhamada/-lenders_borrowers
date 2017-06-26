class Borrower < ApplicationRecord
  has_secure_password
  has_many :histories
  has_many :lenders, through: :histories

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness:true, format: {with: EMAIL_REGEX}


end
