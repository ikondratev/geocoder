Sequel.migration do
  change do
    create_table(:locations) do
      primary_key :id
      column :address, "text", :null=>false
      column :postal_code, "text", :null=>false
      column :country, "text", :null=>false
      column :federal_district, "text", :null=>false
      column :region_type, "text", :null=>false
      column :region, "text", :null=>false
      column :area_type, "text"
      column :area, "text"
      column :city_type, "text", :null=>false
      column :city, "text", :null=>false
      column :settlement_type, "text"
      column :settlement, "text"
      column :kladr_id, "text", :null=>false
      column :fias_id, "text", :null=>false
      column :fias_level, "integer", :null=>false
      column :capital_marker, "integer", :null=>false
      column :okato, "text", :null=>false
      column :oktmo, "text", :null=>false
      column :tax_office, "text", :null=>false
      column :timezone, "text", :null=>false
      column :geo_lat, "text", :null=>false
      column :geo_lon, "text", :null=>false
      column :population, "text", :null=>false
      column :foundation_year, "text", :null=>false
      column :created_at, "timestamp without time zone", :null=>false
      column :updated_at, "timestamp without time zone", :null=>false
      
      index [:city], :name=>:locations_city_key, :unique=>true
    end
    
    create_table(:schema_migrations) do
      column :filename, "text", :null=>false
      
      primary_key [:filename]
    end
    
    create_table(:schema_seeds) do
      column :filename, "text", :null=>false
      
      primary_key [:filename]
    end
  end
end
