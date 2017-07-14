class Collaborator < ActiveRecord::Base
    belongs_to :wiki
    belongs_to :user
    
    self.primary_key = :user_id
end
