class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.string :name
      t.string :confirmation_code
      t.boolean :can_attend
      t.integer :num_attending

      t.timestamps
    end
  end
end
