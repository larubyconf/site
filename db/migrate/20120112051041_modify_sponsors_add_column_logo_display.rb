class ModifySponsorsAddColumnLogoDisplay < ActiveRecord::Migration
  def self.up
    add_column :sponsors, :logo_display, :boolean, :default => true
  end

  def self.down
    remove_column :sponsors, :logo_display
  end
end
