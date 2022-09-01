# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
      else
        can :read, :all
        can :create, Like
        can :manage, Post, author_id: user.id
        can :manage, Comment, user_id: user.id
        can :destroy, Post do |post|
          post.user_id == user.id
        end
        can :destroy, Comment do |comment|
          comment.user_id == user.id
        end
      end
  end
end
