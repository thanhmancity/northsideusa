class AddSubmissionDateToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :submission_date, :datetime
  end
end
