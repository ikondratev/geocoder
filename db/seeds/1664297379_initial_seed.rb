Sequel.seed do
  def run
    Location.create \
      address: "Респ Адыгея, г Адыгейск",
      postal_code: "385200",
      country: "Россия",
      federal_district: "Южный",
      region_type: "Респ",
      region: "Адыгея",
      city_type: "г",
      city: "Адыгейск",
      kladr_id: "0100000200000",
      fias_id: "ccdfd496-8108-4655-aadd-bd228747306d	",
      fias_level: 4,
      capital_marker: 0,
      okato: 79403000000,
      oktmo: 79703000001,
      tax_office: "0107",
      timezone: "UTC+3",
      geo_lat: "44.878414",
      geo_lon: "39.190289",
      population: "12689",
      foundation_year: "1969"
  end
end