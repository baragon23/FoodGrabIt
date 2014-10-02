class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :name, type: String
  field :email, type: String
  field :password_digest, type: String

  validates :email, format: { with: /\A[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})\z/, message: "Invalid email format." }

  # custom validator
  validate :email_must_have_name_in_it

  has_many :places

  has_secure_password

  private
  	# custom validator definition
  	def email_must_have_name_in_it
		if email[0..name.length - 1] != name
		    errors.add(:email, "First part of email address MUST be your name.")
		end
	end
end
