class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end

  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def self.guest
      find_or_create_by!(email: "guest@filmparadiso.com") do |user|
        user.name = "guest user"
        user.email = "guest@filmparadiso.com"
        user.password = SecureRandom.urlsafe_base64
        user.guest = true
        user.confirmed_at = Time.now
      end
  end

  def self.guest_admin
      find_or_create_by!(email: "guest_admin@filmparadiso.com") do |user|
        user.name = "guest admin user"
        user.email = "guest_admin@filmparadiso.com"
        user.password = SecureRandom.urlsafe_base64
        user.admin = true
        user.guest = true
        user.confirmed_at = Time.now
      end
  end

  validates :name,presence:true
  has_many:movie_evaluations, dependent: :destroy
  has_many :active_relationships,foreign_key:'follower_id',class_name:'Relationship',dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :following,through: :active_relationships,source: :followed
  has_many :followers,through: :passive_relationships,source: :follower
  has_many :likes, dependent: :destroy
  has_many :evaluations, through: :likes , source: :movie_evaluation, dependent: :destroy
  has_many :messages, dependent: :destroy
end
