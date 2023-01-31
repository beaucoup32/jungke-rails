class User < ApplicationRecord
  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    
    if user && user.authenticate(password)
      return user
    else
      nil
    end
  end

  has_secure_password

  validates :first_name, :last_name, :password_confirmation,presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: {minimum: 5}

  private
  def login_params
    params.require(:user).permit(:email, :password)
  end
end
