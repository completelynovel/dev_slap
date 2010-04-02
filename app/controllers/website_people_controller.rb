class WebsitePeopleController < BackendResourceController
  
  before_filter :set_website
  
  # GET /websites
  # GET /websites.xml
  def index
    @people = @website.people

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @websites }
    end
  end

  # GET /websites/1
  # GET /websites/1.xml
  def show
    @person = @website.people.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @website }
    end
  end

  # GET /websites/new
  # GET /websites/new.xml
  def new
    @person = Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @website }
    end
  end

  # GET /websites/1/edit
  def edit
    @person = @website.people.find(params[:id])
  end

  # POST /websites
  # POST /websites.xml
  def create
    @person = Person.new(params[:person])
    @website.people << @person
    respond_to do |format|
      if @person.save
        format.html { redirect_to(@website, :notice => 'Website was successfully created.') }
        format.xml  { render :xml => @website, :status => :created, :location => @website }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @website.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /websites/1
  # PUT /websites/1.xml
  def update
    @website = Website.find(params[:id])

    respond_to do |format|
      if @website.update_attributes(params[:website])
        format.html { redirect_to(@website, :notice => 'Website was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @website.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /websites/1
  # DELETE /websites/1.xml
  def destroy
    @website = Website.find(params[:id])
    @website.destroy

    respond_to do |format|
      format.html { redirect_to(websites_url) }
      format.xml  { head :ok }
    end
  end
  
  private
    def set_website
      @website = Website.find(params[:website_id])
    end
end
