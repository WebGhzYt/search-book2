class TagController < ApplicationController
	# def index
	# 	@tags = Tag.all
	# end

	def index
	    @search = Sunspot.search(Tag) do
	    fulltext params[:search]
	    with(:created_at).less_than(Time.zone.now)
	    facet(:publish_month)
	    with(:publish_month, params[:month]) if params[:month].present?
  		end
  		@tags = @search.results
  	end
end
