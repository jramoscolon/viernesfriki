class AddSoundcloudembedToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :soundcloudembed, :text
  end
end
