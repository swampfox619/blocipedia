class BackDefaultToPrivate < ActiveRecord::Migration

  def change
    remove_column :users, :private, :boolean, default: false
  end

end
