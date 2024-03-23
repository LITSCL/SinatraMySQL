require 'sinatra'
require 'json'

require_relative '../config/database'
require_relative '../models/usuario'

db = DataBase.new

post "/usuario/save" do
  #
end

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

get "/usuario/:id" do
  #
end

put "/usuario/:id" do
  #
end

delete "/usuario/:id" do
  #
end
