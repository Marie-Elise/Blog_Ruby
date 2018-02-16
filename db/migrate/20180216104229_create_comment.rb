class CreateComment < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
    t.string :message, required: false 
    t.references :post, null:false, foreign_key: {name: 'post_on_comment' }
    t.references :user, null:false, foreign_key: {name: 'user_on_comment' }
    t.timestamps
    end
  end
end
