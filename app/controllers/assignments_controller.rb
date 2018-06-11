class AssignmentsController < ApplicationController


  	before_action :find_assignment,only:[:show,:edit,:update,:destroy]
  #	before_action :authenticate_user!,except:[:show,:index,:search]
  	def index
  		if params[:cat_note].blank?
  		@assignments = Assignment.all.order("created_at DESC")

  	else
  		@cat_note_id = CatNote.find_by(name: params[:cat_note]).id
  		@assignments = Assignment.where(cat_note_id: @cat_note_id).order("created_at DESC")
  	  end
    end

    def semdate
  		if params[:sem_date].blank?
  		@assignments = Assignment.all.order("created_at DESC")

  	else
  		@sem_date_id = SemDate.find_by(date: params[:sem_date]).id
  		@assignments = Assignment.where(sem_date_id: @sem_date_id).order("created_at DESC")
  	  end
    end

    def institution
  		if params[:name].blank?
  		@assignments = Assignment.all.order("created_at DESC")

  	else
  		@institution_id = Institution.find_by(date: params[:institution]).id
  		@assignments = Assignment.where(institution_id: @institution_id).order("created_at DESC")
  	  end
    end

  	def show
  	end

  	def new
  		@assignment = current_user.assignments.new
  	end

  	def create
  		@assignment = current_user.assignments.new(assignment_params)
  		if @assignment.save

  			redirect_to @assignment,notice:"#{@assignment.course_name} has been created!"
  		else
  			render 'new',notice:"Unable to created Assignment / Note"
  		end
  	end

  	def edit
  	end

  	def search
    @assignments = Assignment.all
    if params[:search]
      @assignments = Assignment.search(params[:search]).order("created_at DESC")
    else
      @assignments = Assignment.all.order("created_at DESC")
    end
  end

  	def update
  		if @assignment.update(assignment_params)
  			redirect_to @assignment,notice:"#{@assignment.course_name} has been updated"
  		else
  			render "edit"
  		end
  	end

  	def destroy
  		@assignment.destroy
  		redirect_to @assignment,notice:"#{@assignment.course_name} has been destroyed"
  	end

  	private

  	def assignment_params
  		params.require(:assignment).permit(:course_code,:course_name,:semister,:attachment,:cat_note_id,:sem_date_id,:year_of_study)
  	end

  	def find_assignment
  		@assignment = Assignment.find(params[:id])
  	end
end
