ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

enable :sessions
set :session_secret, 'Arbitrary secret name'

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps'
  end

  post '/peeps' do
    peep = Peep.create(content: params[:content])
    peep.save
    redirect to('/peeps')
  end

  get '/users/new' do
    erb(:sign_up)
  end

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect to('/peeps')
  end

  helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
  end
end
