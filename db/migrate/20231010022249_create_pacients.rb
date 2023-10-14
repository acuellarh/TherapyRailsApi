class CreatePacients < ActiveRecord::Migration[6.1]
  def change
    create_table :pacients do |t|
      t.references :gender, null: false, foreign_key: true
      t.references :relationship, null: false, foreign_key: true
      t.references :document_type, null: false, foreign_key: true
      t.string :name
      t.string :lastname
      t.date :birthday
      t.string :identifier
      t.string :mobile
      t.string :email
      t.string :address
      t.string :other_contact
      t.string :other_contact_mobile
      t.boolean :status

      t.timestamps
    end
  end
end
