Sequel.migration do
  change do
    create_table(:locations) do
      primary_key :id

      String :address, null: false
      String :postal_code, null: false
      String :country, null: false
      String :federal_district, null: false
      String :region_type, null: false
      String :region, null: false
      String :area_type, null: true
      String :area, null: true
      String :city_type, null: false
      String :city, unique: true, null: false
      String :settlement_type, null: true
      String :settlement, null: true
      String :kladr_id, null: false
      String :fias_id, null: false
      Integer :fias_level, null: false
      Integer :capital_marker, null: false
      String :okato, null: false
      String :oktmo, null: false
      String :tax_office, null: false
      String :timezone, null: false
      String :geo_lat, null: false
      String :geo_lon, null: false
      String :population, null: false
      String :foundation_year, null: false
      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end
  end
end