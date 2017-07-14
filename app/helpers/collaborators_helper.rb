module CollaboratorsHelper

    def is_user_collaborator?(collaborators, user)
        if collaborators.include?(user)
            return true
        else
            return false
        end
    end
    

end
