class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.paginate(:page => params[:page], :per_page => 5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    @events = Event.all
    @event_types = EventType.all
    @recurrences = Recurrence.all
    @event.recurrence = Recurrence.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @events = Event.all
    @event_types = EventType.all
    @resources = Resource.all
    @recurrences = Recurrence.all
    @event_resources = EventResource.where("event_id = ?", @event.id)
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    current_duration = params[:event][:duration].to_f
    @event.duration = @event.start_at + current_duration.hour

    unless @event.recurrence.repetition.nil?
      all_repetition = @event.recurrence.get_repetition
      0.upto(all_repetition.length-1) { |i| @event.children.build(
          name: @event.name,
          event_type_id: @event.event_type_id,
          start_at: all_repetition[i], 
          duration: all_repetition[i] + current_duration.hour
        )}
    end

    respond_to do |format|
      if @event.save
   #     raise params[:resources].inspect
        if params[:resources]
          params[:resources].each {|id_|
            @resource = EventResource.new({:resource_id => id_, :event_id => @event.id})
            @resource.save
          }
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
        else
          format.html { redirect_to @event }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    current_duration = params[:event][:duration].to_f
    #raise params[:event][:duration]
    #raise params[:event][:duration].to_f.inspect
    @event.duration = @event.duration + current_duration.hour
    #raise @event.duration.inspect

    # all_repetition = @event.recurrence.get_repetition
    # 0.upto(all_repetition.length-1) { |i| @event.children.build(
    #     name: @event.name,
    #     event_type_id: @event.event_type_id,
    #     start_at: all_repetition[i], 
    #     duration: all_repetition[i] + current_duration.hour
    #   )}

    respond_to do |format|
      if @event.update_attributes(params[:event])
        if params[:resources]
          params[:resources].each {|param|
            @resource = EventResource.find(param[:id])
            @resource.update_attributes({:resource_id => param[:value], :event_id => @event.id})
          }
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
          else
            format.html { redirect_to @event }
            format.json { render json: @event.errors, status: :unprocessable_entity }
          end
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
  
  def event_based_on
    @event = Event.find(params[:id])
    @event_resources = @event.resources
    @event_all = {
      :event => @event,
      :resources => @event_resources
    }
    render :json => @event_all.to_json
  end
end
