Sequel.migration do
  change do
    create_table(:locations) do
      primary_key :id

      String :lon, null: false
      String :lat, null: false
      String :city, unique: true, null: false
      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end
  end
end