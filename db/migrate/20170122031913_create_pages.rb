class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :body
      t.binary :main_image

      t.timestamps null: false
    end
  end
end
