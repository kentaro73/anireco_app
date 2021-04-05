class AddEpisodeToPosts < ActiveRecord::Migration[6.1]
  def up
    add_column :posts, :episode, :integer
  end

  def down 
    remove_column :posts, :episode, :integer
  end
end
