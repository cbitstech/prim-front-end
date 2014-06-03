# Model for the users. The default devise user model has been modified.
# @author Eric Schlange <eric.schlange@northwestern.edu>
class User < ActiveRecord::Base
  # Role ID constants
  ADMIN_ID = 1
  CONTENT_MANAGER_ID = 2
  PARTICIPANT_ID = 3

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  has_one :role
  after_initialize :init

  def admin?
    ADMIN_ID == self.role_id
  end

  def content_manager?
    CONTENT_MANAGER_ID == self.role_id
  end

  def participant?
    PARTICIPANT_ID == self.role_id
  end

  def init
    if self.role_id.nil?
      self.role_id = PARTICIPANT_ID
    end
  end

  def password_required?
    super if confirmed?
  end

  def password_match?
    errors[:password] <<
      "can't be blank" if password.blank?
    errors[:password_confirmation] <<
      "can't be blank" if password_confirmation.blank?
    errors[:password_confirmation] <<
      "does not match password" if password != password_confirmation
    password == password_confirmation && !password.blank?
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email, :future_contact)
  end
end
