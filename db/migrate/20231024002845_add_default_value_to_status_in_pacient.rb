class AddDefaultValueToStatusInPacient < ActiveRecord::Migration[6.1]
  def change
    change_column :pacients, :status, :boolean, default: true
  end
end
