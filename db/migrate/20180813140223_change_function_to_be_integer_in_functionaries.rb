class ChangeFunctionToBeIntegerInFunctionaries < ActiveRecord::Migration[5.2]
  def change
      #change_column :table_name, :column_name, :new_type
    change_column :functionaries, :function, :integer

  end
end