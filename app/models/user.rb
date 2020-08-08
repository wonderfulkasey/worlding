class User < ApplicationRecord

  has_many :worlds
  accepts_nested_attributes_for :worlds

  has_many :characters, through: :worlds
  has_many :plots, through: :worlds

  validates :name, length: { minimum: 3 }, uniqueness: true
  validates :email, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable

         def self.from_omniauth(auth)  
          where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            user.provider = auth.provider
            user.uid = auth.uid
            user.email = auth.info.email
        
            if auth.info.username
              user.name = auth.info.username
            else
              user.name = auth.info.name
            end

            user.password = Devise.friendly_token[0,20]
          
          end
      end
end
