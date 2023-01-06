class AddReferenceToTables < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!

  def change
    add_reference :points, :user, index: {algorithm: :concurrently}, foreign_key: true
    add_reference :points, :script, index: {algorithm: :concurrently}, foreign_key: true
    add_reference :scripts, :user, index: {algorithm: :concurrently}, foreign_key: true
    add_reference :scripts, :point, index: {algorithm: :concurrently}, foreign_key: true
  end
end