class PagesController < ApplicationController
  before_action :set_group
  before_action :set_page, only: [:show, :edit, :update, :destroy]  

  # GET /pages
  # GET /pages.json
  def index
    @pages = @group.pages
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  # GET /pages/new
  def new
    @page = @group.pages.build
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = @group.pages.build(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to group_path(@group) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to group_path(@group) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to group_path(@group) }      
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.friendly.find(params[:id])
    end

    def set_group
      @group = Group.friendly.find(params[:group_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :content, :group_id)
    end
end
