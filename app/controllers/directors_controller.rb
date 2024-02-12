class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list" })
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id})

    @the_director = matching_records.at(0)

    render({ :template => "director_templates/details" })
  end

  def elder

    matching_records = Director.order(dob: :asc).where.not(dob: nil).first



    record = matching_records

    @eldest_director = record.name

    @id = record.id

    @dob = record.dob

    @format_date = @dob.strftime("%B %d, %Y")
    
  

    render({ :template => "director_templates/eldest" })
  end

  def junior

    matching_records = Director.all.order(:dob)

    record = matching_records.at(-1)

    @youngest_director = record.name

    @id = record.id

    @dob = record.dob

    @format_date = @dob.strftime("%B %d, %Y")

    render({ :template => "director_templates/youngest" })
  end



end
