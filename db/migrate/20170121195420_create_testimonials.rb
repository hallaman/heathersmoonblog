class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :title
      t.text :body
      t.binary :image
      t.boolean :show

      t.timestamps null: false
    end
  end
end
