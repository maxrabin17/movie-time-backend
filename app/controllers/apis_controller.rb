require 'dotenv'
require 'json'
require 'rest-client'
Dotenv.load

class ApisController < ApplicationController
    skip_before_action :authorize, only: [:index]
    
    def index
        @res = RestClient.get "http://www.omdbapi.com/?s=#{params["search"]}&apikey=#{ENV["API_KEY"]}",
        {content_type: :json, accept: :json, "user_key": ENV["API_KEY"]}
        @info = JSON.parse(@res.body)
        render json: @info
    end
end
