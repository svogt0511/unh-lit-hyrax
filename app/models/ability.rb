class Ability
  include Hydra::Ability

  include Hyrax::Ability
  self.ability_logic += [:everyone_can_create_curation_concerns]

  # Define any customized permissions here.
  def custom_permissions
    # Limits deleting objects to a the admin user
    #
    # if current_user.admin?
    #   can [:destroy], ActiveFedora::Base
    # end

	if current_user.admin?
	  can [:create, :show, :add_user, :remove_user, :index, :edit, :update, :destroy], Role
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :dashboard
      can :manage, :all
	end

=begin
	if current_user.rails_admin?
	  can [:create, :show, :add_user, :remove_user, :index, :edit, :update, :destroy], Role
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :dashboard
      can :manage, :all
	end
=end

    can :manage, Zizia::CsvImport if current_user.admin?
    can :manage, Zizia::CsvImportDetail if current_user.admin?

    # Limits creating new objects to a specific group
    #
    # if user_groups.include? 'special_group'
    #   can [:create], ActiveFedora::Base
    # end
  end
end
