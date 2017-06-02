class MedicinesController < ApplicationController
	def new
		@medicine = Medicine.new
	end

	def create
		@medicine = Medicine.new(medicine_params)
		 if @medicine.save
			  flash[:success] = "Added successfully"
    		redirect_to new_medicine_path
    	end
	end

	def index
   	@medicine = Medicine.all 
  end
  	
  	def edit 
  	@medicine = Medicine.find(params[:id])
	end

	def update
		respond_to do |format|
      @medicine = Medicine.find(params[:id])
    		if @medicine.update(medicine_params)
        	format.html { redirect_to medicines_path, notice: 'Medicine was successfully updated.' }
        	format.json { render :show, status: :ok, location: @medicine }
     		else
        	format.html { render :edit }
         	format.json { render json: @medicine.errors, status: :unprocessable_entity }
      	end
    end
	end
  	
  def destroy
    @medicine = Medicine.find(params[:id])
    @medicine.destroy
    redirect_to medicines_path
  end 

	def medicine_params
		params.require(:medicine).permit(:medicine_name, :price, :company_name)
	end
end
