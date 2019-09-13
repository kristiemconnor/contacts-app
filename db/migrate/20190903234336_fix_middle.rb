class FixMiddle < ActiveRecord::Migration[6.0]
  def change

    rename_column :contacts, :middlename, :middle_name
  end
end
