class CreateCountryIds < ActiveRecord::Migration[6.0]
  def change
    create_table :country_ids do |t|

      t.timestamps
    end
  end
end
