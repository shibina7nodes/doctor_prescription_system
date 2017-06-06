class PatientsController < ApplicationController

	def new
		@patient = Patient.new
	end
  
  def create
		@patient = Patient.new(patient_params)
		if @patient.save
			  flash[:notice] = "Added successfully"
    		redirect_to new_patient_path
  		end
  	end
  def index
  	@patient = Patient.all 
    if params[:search]
      @patient = Patient.search(params[:search]).order("created_at DESC")
    else
      @patient = Patient.all.order("created_at DESC")
    end
  end
  	
  	def edit 
  	@patient = Patient.find(params[:id])
	end

	def update
		respond_to do |format|
      @patient = Patient.find(params[:id])
    		if @patient.update(patient_params)
        	format.html { redirect_to patients_path, notice: 'Patient was successfully updated.' }
        	format.json { render :show, status: :ok, location: @patient }
     		else
        	format.html { render :edit }
         	format.json { render json: @patient.errors, status: :unprocessable_entity }
      	end
    end
	end
  	
  	def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to patients_path
  	end 
	
	def patient_params
    params.require(:patient).permit(:p_name, :p_gender, :p_address, :p_age, :p_mobno)
  end

end
