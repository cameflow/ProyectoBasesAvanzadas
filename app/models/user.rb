class User
  include ActiveModel::SecurePassword
  has_secure_password



  include Neo4j::ActiveNode
  has_many :out, :orders, type: :MADE_ORDER
  property :name, type: String
  property :email, type: String
  property :password_digest, type: String
  property :role, type: Integer, default: 3
  validates :email, presence: true, :uniqueness => true




end
