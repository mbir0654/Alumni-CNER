class WorkshopregController < ApplicationController
layout "page"
before_filter :require_admin, :only => [:all]

	def new
		@reg = Workshopreg.new
	end

	def create
		@reg = Workshopreg.new(params[:workshopreg])
		puts params[:reg]
		if @reg.save
			flash[:notice] = "Inregistrare completa!"
			redirect_to :action => "index"
		else
			flash[:notice] = "Au aparut probleme in timpul inregistrarii, va rugam reincercati mai tarziu"
			render :action => "new"
		end
	end

	def all
		@reg = Workshopreg.all
		@total = @reg.count
	end	
end
