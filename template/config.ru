require 'sinatra'
require 'yaml'
require 'persona'
 
set :environment, :production
disable :run

$config = YAML.load_file('./config/persona.yaml')
run Sinatra::Application