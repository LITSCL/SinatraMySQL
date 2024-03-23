require 'sinatra'
require 'json'

require_relative '../config/database'
require_relative '../models/usuario'

db = DataBase.new

get "/usuario" do
  begin
    db.conectar
    usuarios = Usuario.all
    return JSON.generate usuarios.map &:attributes
  rescue => e
    status 500
    return body "SERVIDOR: Error interno del servidor"
  ensure
    db.desconectar
  end
end
