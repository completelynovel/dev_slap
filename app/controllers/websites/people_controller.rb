class Websites::PeopleController < BackendResourceController
  
  before_filter :set_website
  
  # GET /websites
  # GET /websites.xml
  def index
    @website_people = @website.website_people

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @websites }
    end
  end

  # GET /websites/1
  # GET /websites/1.xml
  def show
    @website_person = @website.website_people.find(params[:id])

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @website }
    end
  end

  # GET /websites/new
  # GET /websites/new.xml
  def new
    @website_person = WebsitePerson.new
    @person = Person.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @website }
    end
  end

  # GET /websites/1/edit
  def edit
    @website_person = @website.website_people.find(params[:id])
    @person = @website_person.person
  end

  # POST /websites
  # POST /websites.xml
  def create
    @website_person = WebsitePerson.new(params[:website_person])
    @website_person.website = @website
    
    @person = Person.find_by_email(params[:person][:email])
    if @person.present?
    else
      @person = Person.new(params[:person])
      password = Person.newpass
      @person.password = @person.password_confirmation = password
    end
    @person.website_people << @website_person
    
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
    @website_person = WebsitePerson.find(params[:id])
    @website_person.attributes = params[:website_person]
    @person = @website_person.person
    @person.website_people << @website_person
    respond_to do |format|
      if @person.save
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
    @website_person = WebsitePerson.find(params[:id])
    @website_person.destroy

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
