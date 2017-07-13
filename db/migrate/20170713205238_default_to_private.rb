class DefaultToPrivate < ActiveRecord::Migration
  def change
    change_column :users, :private, :boolean, default: false
  end


end
