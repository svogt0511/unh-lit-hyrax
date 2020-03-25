class User < ApplicationRecord
  # Allows us to check for changes to the model.
  include ActiveModel::Dirty
  # Connects this user object to Hydra behaviors.
  include Hydra::User
  # Connects this user object to Role-management behaviors.
  include Hydra::RoleManagement::UserRoles

  # Connects this user object to Hyrax behaviors.
  include Hyrax::User
  include Hyrax::UserUsageStats

  ### HYDRA ROLE MANAGEMENT - AUTHORIZATION
  # Authorization: add rails_admin role.
  def is_site_admin?
	roles.where(name: 'site_admin').exists?  || roles.where(name: 'site_admin').exists?
  end

  # Authorization: override admin role from Hydra::RoleManagement::UserRoles
  def is_admin?
	roles.where(name: 'admin').exists?
  end

  if Blacklight::Utils.needs_attr_accessible?
    attr_accessible :email, :password, :password_confirmation
  end
  # Connects this user object to Blacklights Bookmarks.
  include Blacklight::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates_uniqueness_of :username

  # Method added by Blacklight; Blacklight uses #to_s on your
  # user class to get a user-displayable login/identifier for
  # the account.
  def to_s
    email
  end

  ### DEVISE - AUTHENTICATION
  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    approved? ? super : :not_approved
  end

  def self.send_reset_password_instructions(attributes={})
    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    if !recoverable.approved?
      recoverable.errors[:base] << I18n.t("devise.failure.not_approved")
    elsif recoverable.persisted?
      recoverable.send_reset_password_instructions
    end
    recoverable
  end

  ### DEVISE - NEW USER EMAIL APPROVALS
  after_create :send_admin_mail
  def send_admin_mail
    AdminMailer.new_user_waiting_for_approval(email).deliver
  end

  before_save :check_admin_mail_approved
  def check_admin_mail_approved
    if approved_changed?
        if self.approved_changed?(to: true)
          AdminMailer.new_user_approved(self.email).deliver
        end
    end
  end

  def send_admin_mail_approved
    AdminMailer.new_user_approved(self.email).deliver
  end

  # Implement username as login instead of email

  # We want username to be case sensitive, but email to be case insensitive
  # validates :username, presence: :true, uniqueness: { case_sensitive: false }

  ## Mods to add username for login.
  attr_writer :login

  def login
    @login || self.username || self.email
    # :email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
      # where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      conditions[:email].downcase! if conditions[:email]
      where(conditions.to_h).first
     end
  end

  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
end
