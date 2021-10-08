class RemoveTimestampsFromTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :created_at, :string
    remove_column :projects, :updated_at, :string
    remove_column :todos, :created_at, :string
    remove_column :todos, :updated_at, :string
  end
end
