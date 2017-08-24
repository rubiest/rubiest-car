class User < ApplicationRecord
  enum role: [:staff, :agent, :dropship]
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login

  has_one :company_profile, dependent: :destroy

  before_create :build_default_company_profile

  validates :username,
    presence: true,
    uniqueness: {
      case_sensitive: false
  }
  validate :validate_username

  default_scope -> { order('users.created_at DESC') }

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { value: login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

  private

    def build_default_company_profile
      build_company_profile
      true
    end
end
