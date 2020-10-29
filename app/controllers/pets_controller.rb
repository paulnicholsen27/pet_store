class PetsController < ApplicationController

    skip_before_action :verify_authenticity_token

    def index 
        puts "hit our index view"
        @pets = Pet.all
        render(:index)
    end

    def show
        @pet = Pet.find(params[:id])
    end

    def create
        # code to create a new pet from params
        # params = {name: "Petey", species: "cat"
        #           year_of_birth: 2020, good_with_kids: true}
        puts "post request to /pets has been made and now we're here"
        pet = Pet.create(name: params[:name],
                   species: params[:species],
                   year_of_birth: params[:year_of_birth],
                   good_with_kids: params[:good_with_kids])
        redirect_to pet_path(pet.id)

    end

    def new
        render :new_pet_form
    end

    def toggle_good_with_kids
        pet = Pet.find(params[:id])
        pet.good_with_kids = !pet.good_with_kids
        pet.save 
        redirect_to pet_path(pet.id)
    end
end
