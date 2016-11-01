class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def new_form
    render ("photos/new.html.erb")
  end

  def show
    @photo= Photo.find_by({ :id => params[:id]})
    render ("photos/details.html.erb")
  end

  def create_row
    p = Photo.new
    p.source = params["the_source"].to_s
    p.caption = params["the_caption"].to_s
    p.save
    @list_of_photos =Photo.all
    render ("photos/index.html.erb")
  end

  def destroy
    i = Photo.find_by({ :id => params[:id]})
    i.destroy
    @list_of_photos =Photo.all
    render ("photos/index.html.erb")
  end

  def edit_form
    @photo= Photo.find_by({ :id => params[:id]})
    render ("photos/edit.html.erb")
  end

  def update_row
    @photo= Photo.find_by({ :id => params[:id]})
    if params["the_caption"] != nil
      @photo.caption=params["the_caption"]
    end
    if params["the_source"] != nil
      @photo.source=params["the_source"]
    end
    @photo.save
    redirect_to("http://localhost:3000/photos/#{@photo.id}")
  end

end
