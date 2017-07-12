class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :contact, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_attachment :documents, :gpx
  end
end
