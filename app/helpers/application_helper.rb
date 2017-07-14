module ApplicationHelper

    require 'redcarpet'

    def is_user_collaborator?(user)
        if @wiki.collaborator_ids.include?(user.id)
            return true
        else
            return false
        end
    end
    
    def flash_class(key)
        case key
            when "notice" then "alert alert-info"
            when "alert" then "alert alert-danger"
        end
    end
    
    def markdown(text)
        Redcarpet::Render::HTML.new(text)
    end

end
