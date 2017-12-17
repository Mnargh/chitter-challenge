ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative './models/peep'

class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps'
  end

  post '/peeps' do
    Peep.create(content: params[:content])
    redirect to('/peeps')
  end

  get '/peeps/new' do
    erb(:add_peep)
  end

end
