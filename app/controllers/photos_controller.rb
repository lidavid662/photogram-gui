class PhotosController < ApplicationController
  def index
    @photos = Photo.all.order({ :created_at => :desc })

    render({ :template => "photos/index" })
  end
  def show
    the_id = params.fetch("path_id")
    @photo = Photo.where({:id => the_id }).at(0)

    render({ :template => "photos/show" })
  end
  def create
    @photo = Photo.new
    @photo.image = params.fetch("input_image")
    @photo.caption = params.fetch("input_caption")
    @photo.owner_id = params.fetch("input_owner_id")

    if @photo.valid?
      @photo.save
      redirect_to("/photos/#{@photo.id}", { :notice => "Department created successfully." })
    else
      redirect_to("/photos", { :notice => "Department failed to create successfully." })
    end
  end
  def destroy
    the_id = params.fetch("path_id")
    @photo = Photo.find(the_id)
    
    @photo.destroy

    redirect_to("/photos", { :notice => "Deleted!" })
  end
  def update
    the_id = params.fetch("path_id")
    @photo = Photo.find(the_id)
    @photo.image = params.fetch("input_image")
    @photo.caption = params.fetch("input_caption")
    @photo.save
    redirect_to("/photos/#{@photo.id}", { :notice => "Actor updated successfully."} )
  end

  
  def comment
    @comment = Comment.new
    @comment.author_id = params.fetch("aid")
    @comment.photo_id = params.fetch("path_id")
    @comment.body = params.fetch("com")
    @comment.save
    the_id = params.fetch("path_id")
    @photo = Photo.find(the_id)
    redirect_to("/photos/#{@photo.id}", { :notice => "Commented."} )
  end
end
