class Reunion

  attr_reader :location, :activities

  def initialize(location, activities)
    @location = location
    @activities = [activities]
  end

  def add_activity(activity_name, participants)
    activity = Activity.new(activity_name, participants)
    @activities << activity
  end

  def total_cost
    cost = 0
    @activities.each do |activity|
      cost += activity.total_cost
    end
    cost
  end

  def total_participants
    participants = []
    @activities.each do |activity|
      activity_participants = activity.participants.keys
      participants << activity_participants
    end
    participants.flatten.count
  end


  def participant_debt(participant)
    cost = total_cost
    participants = total_participants
    split_cost = cost / participants
  end




end
