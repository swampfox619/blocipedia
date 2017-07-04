class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
         
  after_create :send_confirmation_instructions
  
  private
  
  def send_confirmation_instructions
    ConfirmationMailer.confirmation_instructions(user).deliver_now
end
