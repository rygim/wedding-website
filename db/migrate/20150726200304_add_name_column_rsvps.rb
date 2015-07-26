class AddNameColumnRsvps < ActiveRecord::Migration
  def change
  	add_column :rsvps, :real_name, :string
  end
end
