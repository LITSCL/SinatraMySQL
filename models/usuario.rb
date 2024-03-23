require 'sinatra/activerecord'

class Usuario < ActiveRecord::Base
  self.table_name = "usuario"
  self.primary_key = "id"

  alias_attribute :nombre, :nombre
  alias_attribute :correo, :correo
  alias_attribute :clave, :clave

  def to_json opciones = {}
    return (attributes.slice "id", "nombre", "correo", "clave").to_json opciones
  end
end
