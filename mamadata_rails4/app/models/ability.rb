class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)

    if user
      can :read, :all
      cannot :read, Role
      cannot :read, DonorType
      cannot :read, User
    end

    case user.role
    when "admin"
      can :manage, :all
      can :grant, BenefitIncident
    when "social_worker"
      can :manage, Person
      cannot :destroy, Person
      can :manage, Family
      can :update, CommunityDevelopment
      can :manage, School
      can :manage, SchoolClass
      can :manage, GodfatherPerson
      can :manage, PersonGodfatherFile
      can :manage, Journal
      can :manage, BenefitIncident
      cannot :grant, BenefitIncident
    when "accountant"
    can :update, Benefit
    can :manage, BenefitIncident
    when "supporter"
    # only read
    when "sharana_france"
      cannot :read, :all
      can :manage, Supporter, donor_type_id: 1
    else
      cannot :manage, :all
    end

    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
