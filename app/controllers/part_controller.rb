class PartController < ApplicationController
    get "/part/:id" do
        @part = Part.find_by_id(params[:id])
        erb :'parts/show'
    end

    get "/part/:id/edit" do
        @part = Part.find_by_id(params[:id])
        erb :'parts/edit'
    end

    patch "/part/:id/edit" do
        @part = Part.find_by_id(params[:id])
        if params[:name] != @part.name && params[:price] != @part.price && params[:ordered] != @part.ordered
            @part.update(params[:part])
        end
        redirect "/part/#{@part.id}"
    end
end