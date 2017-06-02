class PrescriptnsController < ApplicationController
	
def new
	@prescriptn = Prescriptn.new
	@prescriptn.prescriptn_details.build
	@patient = Patient.all
	@doctor = Doctor.all
	@medicines = Medicine.all
	# @prescriptn = Prescriptn_detail.build
end

def create
	@prescriptn = Prescriptn.new(prescriptn_params)
	if @prescriptn.save
		redirect_to new_prescriptn_path
	end
end

def index
	@prescriptn = Prescriptn.new 
end

def show_prescrition

    @pres = Prescriptn.find(params[:id])

    respond_to do |format|
      format.pdf do
        render pdf: "file_name_of_your_choice",
               template: "show.pdf.erb",
               locals: {:invoice => @pres}
      end
    end
  end


def prescriptn_params
  params.require(:prescriptn).permit(:doctor_id, :patient_id, prescriptn_details_attributes: [:id, :medicine_name, :medicine_count, :days, :tyms], )
	end
end
