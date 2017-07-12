class DocumentsController < ApplicationController

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(documents_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to contacts_path, notice: 'Import successfull.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def documents_params
    params.require(:document).permit(:gpx)
  end
end
