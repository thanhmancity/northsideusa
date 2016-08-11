class ChangeContactsMessageToLongText < ActiveRecord::Migration
  def change
    change_column :contacts, :message,  :longtext
  end
end
