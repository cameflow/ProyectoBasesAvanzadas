class User
  include ActiveModel::SecurePassword
  has_secure_password

  include Neo4j::ActiveNode
  property :name, type: String
  property :email, type: String
  property :password_digest, type: String
  property :role, type: Integer
  validates :email, presence: true, :uniqueness => true




end
