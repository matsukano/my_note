class NotesController < ApplicationController
  protect_from_forgery
  def index
    @notes = Note.all.order("created_at DESC")
    @note = Note.new
  end

  def show
    @note = Note.find(params[:id])
    text = @note.text
    note = Note.where.not(title: @note.title)
    note.each do |note|
      text = text.sub(/#{note.title}/, "#{note.title}(http://localhost:3000/notes/#{note.id})")
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
    def note_params
      params.require(:note).permit(:title, :text)
    end
end
