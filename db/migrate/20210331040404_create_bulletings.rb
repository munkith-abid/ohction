class CreateBulletings < ActiveRecord::Migration[6.1]
  def change
    create_table :bulletings do |t|
      t.string :bulleting
    end
  end
end
