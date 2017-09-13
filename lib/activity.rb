class Activity

  attr_reader :name, :participants

  def initialize(name, participants = {})
    @name = name
    @participants = participants
  end

  def total_cost
    costs = @participants.values
    costs.sum
  end

  def split_cost
    no_of_participants = @participants.keys.count
    cost = total_cost

    cost / no_of_participants
  end

  def amount_owed(participant)
    amount_paid = @participants[participant]
    split_cost - amount_paid
  end
end
