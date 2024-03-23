require 'sinatra'
require 'json'

require_relative '../config/database'
require_relative '../models/usuario'

db = DataBase.new

post "/usuario/save" do
  nombre = params[:nombre]
  correo = params[:correo]
  clave = params[:clave]

  begin
    db.conectar
    usuario = Usuario.create nombre: nombre, correo: correo, clave: clave
    return JSON.generate usuario
  rescue => e
    status 500
    return body "SERVIDOR: Error interno del servidor"
  ensure
    db.desconectar
  end
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
  id = params[:id]

  begin
    db.conectar
    usuario = Usuario.find_by id: id
    if usuario
      return JSON.generate usuario
    else
      status 404
      return body "SERVIDOR: Usuario no encontrado"
    end
  rescue => e
    status 500
    return body "SERVIDOR: Error interno del servidor"
  ensure
    db.desconectar
  end
end

put "/usuario/:id" do
  id = params[:id]
  nombre = params[:nombre]
  correo = params[:correo]
  clave = params[:clave]

  begin
    db.conectar
    usuario = Usuario.find_by id: id
    if usuario
      usuario.nombre = nombre if params[:nombre]
      usuario.correo = correo if params[:correo]
      usuario.clave = clave if params[:clave]
      usuario.save
      return JSON.generate usuario
    else
      status 404
      return body "SERVIDOR: Usuario no encontrado"
    end
  rescue => e
    status 500
    return body "SERVIDOR: Error interno del servidor"
  ensure
    db.desconectar
  end
end

delete "/usuario/:id" do
  id = params[:id]

  begin
    db.conectar
    usuario = Usuario.find_by id: id
    if usuario
      usuario.destroy
      return JSON.generate usuario
    else
      status 404
      return body "SERVIDOR: Usuario no encontrado"
    end
  rescue => e
    status 500
    return body "SERVIDOR: Error interno del servidor"
  ensure
    db.desconectar
  end
end
