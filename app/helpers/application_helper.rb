module ApplicationHelper

    require 'redcarpet'


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
