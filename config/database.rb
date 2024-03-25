require 'sinatra/activerecord'

class DataBase
  attr_accessor(
    :servidor,
    :usuario,
    :clave,
    :base_de_datos,
    :puerto
  )

  def initialize
    @servidor = "localhost"
    @usuario = "root"
    @clave = "root"
    @base_de_datos = "dbsinatramysql"
    @puerto = 3306
  end

  def conectar
    ActiveRecord::Base.establish_connection(
      adapter: "mysql2",
      host: self.servidor,
      username: self.usuario,
      password: self.clave,
      database: self.base_de_datos,
      port: self.puerto
    ).connection
  end

  def desconectar
    ActiveRecord::Base.connection_pool.disconnect!
  end
end
