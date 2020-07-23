ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake' #here becuase only needed to run RAKE tasks 

task :console do 
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    Pry.start
end
