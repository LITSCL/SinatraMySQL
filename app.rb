require 'sinatra'
require 'sinatra/contrib'

require_relative 'routes/usuario_route'

#Habilitar la renderización de plantillas ERB.
register Sinatra::Contrib

#Indicar el directorio de vistas.
set :views, (File.dirname __FILE__) + "/templates"

#Asignar vistas a rutas.
get "/" do
  erb :index
end
