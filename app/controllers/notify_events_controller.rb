class NotifyEventsController < ApplicationController
  # GET /notify_events
  # GET /notify_events.json
  def index
    @notify_events = NotifyEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @notify_events }
    end
  end

  # GET /notify_events/1
  # GET /notify_events/1.json
  def show
    @notify_event = NotifyEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @notify_event }
    end
  end

  # GET /notify_events/new
  # GET /notify_events/new.json
  def new
    @notify_event = NotifyEvent.new
     
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @notify_event }
    end
  end

  # GET /notify_events/1/edit
  def edit
    @notify_event = NotifyEvent.find(params[:id])
  end

  # POST /notify_events
  # POST /notify_events.json
  def create
    raise params.inspect
    @notify_event = NotifyEvent.new(params[:notify_event])
    params[:notify_event]  
    @notify_event.recipients.create = params[:notify_event]
    raise "@notify_event: #{@notify_event.inspect}"
    # @notify_event.template_mappings = params[:notify_event]
    respond_to do |format|
      if @notify_event.save
        NotifyEventMailer.notify_event_email.deliver
        format.html { redirect_to @notify_event, :notice => 'Notify event was successfully created.' }
        format.json { render :json => @notify_event, :status => created, :location => @notify_event }
      else
        format.html { render :action => "new" }
        format.json { render :json => @notify_event.errors, :status => unprocessable_entity }
      end
    end
  end

  # PUT /notify_events/1
  # PUT /notify_events/1.json
  def update
    @notify_event = NotifyEvent.find(params[:id])

    respond_to do |format|
      if @notify_event.update_attributes(params[:notify_event])
        format.html { redirect_to @notify_event, :notice => 'Notify event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @notify_event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /notify_events/1
  # DELETE /notify_events/1.json
  def destroy
    @notify_event = NotifyEvent.find(params[:id])
    @notify_event.destroy

    respond_to do |format|
      format.html { redirect_to notify_events_url }
      format.json { head :no_content }
    end
  end
  
  def show_property_mapping_content
    template = NotifyTemplate.find(params[:template_id].to_i)
    puts "*"*300
    parameters = template.body.scan(/\$\$\{([a-zA-Z]+)\}/).flatten
    puts "template: #{template.inspect}"  
    puts "parameters: #{parameters.inspect}"
    properties = NotifyObserverProperty.where("notify_observer_id=?",params[:observer_id].to_i)
    puts "property: #{properties.inspect}"  
    render :partial => "notify_event_property_mapping", :collection => parameters, :as => 'parameter', :locals => {:properties => properties}, :layout => false
  end  
  
end
