ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps'
  end

  post '/peeps' do
    peep = Peep.create(content: params[:content])
    peep.save
    redirect to('/peeps')
  end

  get '/peeps/new' do
    erb(:add_peep)
  end

end
