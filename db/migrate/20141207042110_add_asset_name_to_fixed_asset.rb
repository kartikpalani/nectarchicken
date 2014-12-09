class AddAssetNameToFixedAsset < ActiveRecord::Migration
  def change
    add_column :fixed_assets, :asset_name, :string
  end
end
