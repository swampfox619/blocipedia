class WikiPolicy < ApplicationPolicy

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def index?
    @user.role
  end

  def show?
    @user.role
  end

  def create?
    @user.role
  end

  def new?
    @user.role
  end

  def update?
    @user.role
  end

  def edit?
    @user.role
  end

  def destroy?
    @user.admin? || @user == @wiki.user
  end

end