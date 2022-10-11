class Location < Sequel::Model
  def validate
    super
    validates_presence :lat, message: I18n.t(:blank, scope: 'model.errors.location.lat')
    validates_presence :lon, message: I18n.t(:blank, scope: 'model.errors.location.lon')
    validates_presence :city, message: I18n.t(:blank, scope: 'model.errors.location.city')
  end
end
