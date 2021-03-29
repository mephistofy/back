class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :messages, dependent: :destroy
  has_one :user_room, dependent: :destroy
       
  validates :name, presence: true
      
  def unread_count
    Message.unread(user_room.read_at, id).size
  end
end
