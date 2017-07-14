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
        @user.role
        # @user.admin? || @user == @wiki.user
    end
    
    class Scope
        attr_reader :user, :scope
    
        def initialize(user, scope)
            @user = user
            @scope = scope
        end
    
        def resolve
            wikis = []
            if user.role == 'admin'
                wikis = scope.all # if the user is an admin, show them all the wikis
            elsif user.role == 'premium'
                all_wikis = scope.all
                all_wikis.each do |wiki|
                    if wiki.private == false || wiki.user_id == user.id || wiki.collaborator_ids.include?(user.id)
                    wikis << wiki # if the user is premium, only show them public wikis, or that private wikis they created, or private wikis they are a collaborator on
                    end
                end
            else # this is the lowly standard user
                all_wikis = scope.all
                wikis = []
                all_wikis.each do |wiki|
                    if wiki.private == false || wiki.collaborator_ids.include?(user.id)
                    wikis << wiki # only show standard users public wikis and private wikis they are a collaborator on
                    end
                end
            end
        wikis # return the wikis array we've built up
        end
    end
end