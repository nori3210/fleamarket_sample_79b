class AddCategoryToUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :nickname
      t.string :email
      t.string :password
      t.string :familyname
      t.string :familyname_kana
      t.string :firstname
      t.string :firstname_kana
      t.date :bairthday
    end
  end
end
