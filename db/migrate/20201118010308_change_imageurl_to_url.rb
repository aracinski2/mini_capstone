class ChangeImageurlToUrl < ActiveRecord::Migration[6.0]
  def change
    rename_column :images, :image_url, :url
  end
end
