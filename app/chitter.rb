require 'sinatra/base'
# require_relative 'data_mapper_setup'
require_relative './models/peep'

class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps'
  end

  
end
