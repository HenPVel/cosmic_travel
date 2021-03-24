class ScientistsController < ApplicationController
    
    def index
        @scientists= Scientist.all
    end

    def show
        @scientist = Scientist.find(params[:id])
    end

    def new
        @scientist = Scientist.new
    end

    def create
        @scientist = Scientist.new(params.require(:scientist).permit(:name, :field_of_study))
        @scientist.save
        redirect_to scientist_path(@scientist.id)
    end

    def edit
        @scientist = Scientist.find(params[:id])
    end

    def update
        @scientist = Scientist.find(params[:id])
        @scientist.update(params.require(:scientist).permit(:name, :field_of_study, :id))
        redirect_to scientist_path(@scientist.id)
    end

    def destroy
        @scientist = Scientist.find(params[:id])
        @scientist.destroy
        redirect_to scientists_path
    end
    
end
