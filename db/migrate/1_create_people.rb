class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, null: false, index: true
      t.string :email, null: true, index: true
      t.integer :clef_id, limit: 8, null: true, index: true
      t.boolean :activated, null: false, default: false
      t.references :invited_by_person, index: true #, foreign_key: {to_table: :people} # wishing for Rails 5, f.k. manually below

      t.timestamps null: false
    end

    add_foreign_key :people, :people, column: :invited_by_person_id
  end
end
