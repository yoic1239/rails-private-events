class EventAttendancesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @attendance = @event.event_attendances.build(attendee: current_user)

    if @attendance.save
      redirect_to @event, notice: "You have successfully registered for this event."
    else
      redirect_to @event, alert: "Unable to register for the event."
    end
  end
end
