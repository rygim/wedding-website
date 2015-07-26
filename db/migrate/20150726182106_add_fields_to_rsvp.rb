class AddFieldsToRsvp < ActiveRecord::Migration
  def change
    add_column :rsvps, :max_attending, :integer
    add_column :rsvps, :has_responded, :boolean
    add_column :rsvps, :messages, :string
  end
end
