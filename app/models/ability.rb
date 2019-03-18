class Ability
  include CanCan::Ability

  def initialize user
    alias_action :assign_trainee, :add_trainee, :delete_trainee,
      to: :manage_trainee
    alias_action :start, :finish, to: :start_finish
    alias_action :create, :read, :update, :destroy, to: :crud
    alias_action :read, :update, :destroy, to: :rud
    user ||= User.new
    if user.suppervisor?
      can :manage, :all
    else
      can [:read, :update, :start_finish, :manage_trainee],
        Course, suppervisor_id: user.id
      can [:read, :start_finish], CourseSubject,
        course: {suppervisor_id: user.id}
      can :rud, Subject, suppervisor_id: user.id
      can :crud, Task, subject: {suppervisor_id: user.id}
      can :update, User, id: user.id
      can :show, User
      can :read, UserCourse, user_id: user.id
      can [:read, :finish], UserSubject, user_id: user.id
    end
  end
end
