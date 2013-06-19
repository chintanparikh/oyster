class AddEndpointIdToContent < ActiveRecord::Migration
  def change
    add_column :contents, :endpoint_id, :integer
  end
end
