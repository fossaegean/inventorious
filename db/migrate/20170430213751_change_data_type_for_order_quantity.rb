class ChangeDataTypeForOrderQuantity < ActiveRecord::Migration[5.0]
  def self.up
    change_table :orders do |t|
      t.change :quantity, :integer
    end
  end

  def self.down
    change_table :orders do |t|
      t.change :fieldname, :string
    end
  end
end
