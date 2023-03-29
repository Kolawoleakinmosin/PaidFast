class User < ApplicationRecord
  has_many :transactions
  has_one :product, dependent: :destroy
  has_one :account, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
