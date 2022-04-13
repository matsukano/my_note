class NotesController < ApplicationController
  before_action :basic_auth
  protect_from_forgery
  def index
    @notes = Note.all.order("created_at DESC")
    @note = Note.new
  end

  def show
    @note = Note.find(params[:id])
    text = @note.text
    @all_title = Note.where.not(title: @note.title)
    #@all_title.each do |all_title|
     #text = text.sub!(/#{all_title.title}/, "[#{all_title.title}](http://localhost:3000/notes/#{all_title.id})")
    #end
    @all_title.each do |all_title|
      text = text.sub!(/#{all_title.title}/, "[#{all_title.title}](https://my-note-37454.herokuapp.com/notes/#{all_title.id})")
     end
    @text = text
  end

  def new 
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to root_path
    else
      @notes = Note.all.order("created_at DESC")
      render "index"
    end
  end

  def edit
    @note = Note.find(params[:id])

  end

  def update
    @note = Note.find(params[:id])
 
    if @note.update(note_params)
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to root_path
  end

  def search
    @notes = Note.search(params[:keyword])
  end

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"] 
    end
  end
  def note_params
    params.require(:note).permit(:title, :text)
  end
end
