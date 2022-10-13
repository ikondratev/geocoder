class Location < Sequel::Model
  def validate
    super
    validates_presence :address, message: I18n.t(:blank, scope: 'model.errors.location.address')
    validates_presence :postal_code, message: I18n.t(:blank, scope: 'model.errors.location.postal_code')
    validates_presence :country, message: I18n.t(:blank, scope: 'model.errors.location.country')
    validates_presence :federal_district, message: I18n.t(:blank, scope: 'model.errors.location.federal_district')
    validates_presence :region_type, message: I18n.t(:blank, scope: 'model.errors.location.region_type')
    validates_presence :region, message: I18n.t(:blank, scope: 'model.errors.location.region')
    validates_presence :city_type, message: I18n.t(:blank, scope: 'model.errors.location.city_type')
    validates_presence :city, message: I18n.t(:blank, scope: 'model.errors.location.city')
    validates_presence :kladr_id, message: I18n.t(:blank, scope: 'model.errors.location.kladr_id')
    validates_presence :fias_id, message: I18n.t(:blank, scope: 'model.errors.location.fias_id')
    validates_presence :fias_level, message: I18n.t(:blank, scope: 'model.errors.location.fias_level')
    validates_presence :capital_marker, message: I18n.t(:blank, scope: 'model.errors.location.capital_marker')
    validates_presence :okato, message: I18n.t(:blank, scope: 'model.errors.location.okato')
    validates_presence :oktmo, message: I18n.t(:blank, scope: 'model.errors.location.oktmo')
    validates_presence :tax_office, message: I18n.t(:blank, scope: 'model.errors.location.tax_office')
    validates_presence :timezone, message: I18n.t(:blank, scope: 'model.errors.location.timezone')
    validates_presence :geo_lat, message: I18n.t(:blank, scope: 'model.errors.location.geo_lat')
    validates_presence :geo_lon, message: I18n.t(:blank, scope: 'model.errors.location.geo_lon')
    validates_presence :population, message: I18n.t(:blank, scope: 'model.errors.location.population')
    validates_presence :foundation_year, message: I18n.t(:blank, scope: 'model.errors.location.foundation_year')
  end
end
