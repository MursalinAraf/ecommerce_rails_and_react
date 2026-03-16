class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable,  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {user: 0, admin: 1}       


  validates :first_name, presence: true            
  validates :password, format: { with: /\A(?=.*[A-Z])(?=.*\d).+\z/,
                                 message: "must include at least one uppercase letter and one number" }, on: :create
end
