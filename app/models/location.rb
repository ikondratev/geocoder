class Location < Sequel::Model
  def validate
    super
    validates_presence :name, message: I18n.t(:blank, scope: 'model.errors.location.lat')
    validates_presence :email, message: I18n.t(:blank, scope: 'model.errors.location.lon')
    validates_presence :password_digest, message: I18n.t(:blank, scope: 'model.errors.location.city')
  end
end
