class Ability
  include CanCan::Ability

def initialize(user)
    user ||= User.new # guest user

    if user.admin?
        can :manage, :all
    else
        can :read, :episodes
        can :update, User do |u|
        	u.id == user.id
        end
        can :show, User do |u|
        	u.id == user.id
        end

    end
  end


end
