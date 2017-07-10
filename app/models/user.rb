class User < ActiveRecord::Base

  enum role: [:standard, :premium, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :standard
  end
  
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  
  has_many :wikis
  
  def stripe_customer
    if stripe_id?
      Stripe::Customer.retrieve(stripe_id)
    else
      stripe_customer = Stripe::Customer.create(email: email)
      update(stripe_id: stripe_customer.id)
      stripe_customer
    end
  end
  
  def subscribed?
    stripe_subscription_id? || (expires_at? && Time.zone.now < expires_at)
  end
  
end