class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :tel
      t.string :name
      t.string :email
      t.string :refcode
      t.string :refcounter
      t.string :ip
      t.string :sharefb
      t.string :incounter
      t.string :form
      t.string :printed

      t.timestamps
    end
  end
end
