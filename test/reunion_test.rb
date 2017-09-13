require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  def test_it_exists
    participants = {'Aurora'=>10}
    activity = Activity.new('code', participants)
    reunion = Reunion.new('Turing', activity)

    assert_instance_of Reunion, reunion
  end

  def test_it_has_location
    participants = {'Aurora'=>10}
    activity = Activity.new('code', participants)
    reunion = Reunion.new('Turing', activity)

    assert_equal 'Turing', reunion.location
  end

  def test_it_has_activity
    participants = {'Aurora'=>10}
    activity = Activity.new('code', participants)
    reunion = Reunion.new('Turing', activity)

    assert_instance_of Activity, reunion.activities.first
    assert_equal 'code', reunion.activities.first.name
    assert_equal ({'Aurora'=>10}), reunion.activities.first.participants
  end

  def test_it_can_add_activity
    participants = {'Aurora'=>10}
    activity = Activity.new('code', participants)
    reunion = Reunion.new('Turing', activity)
    activity_two = reunion.add_activity('stress about battleship', {'the whole class'=>0})

    assert_equal 2, reunion.activities.length
    assert_equal 'code', reunion.activities.first.name
    assert_equal ({'the whole class'=>0}), reunion.activities[1].participants
  end

  def test_it_calculates_total_cost_of_reunion
    participants = {'Aurora'=>10}
    activity = Activity.new('code', participants)
    reunion = Reunion.new('Turing', activity)
    activity_two = reunion.add_activity('stress about battleship', {'the whole class'=>0})

    assert_equal 10, reunion.total_cost
  end

  def test_it_can_find_total_participants_in_reunion
    participants = {'Aurora'=>10, 'Emily'=>20}
    activity = Activity.new('eat snacks', participants)
    reunion = Reunion.new('Turing', activity)
    activity_two = reunion.add_activity('eat dinner', {'Iza'=>30})

    assert_equal 3, reunion.total_participants
  end

  def test_it_calculates_total_owed_per_participant
    participants = {'Aurora'=>10, 'Emily'=>20}
    activity = Activity.new('eat snacks', participants)
    reunion = Reunion.new('Turing', activity)
    activity_two = reunion.add_activity('eat dinner', {'Iza'=>30})

    assert_equal 10, reunion.participant_debt('Aurora')
    assert_equal 0, reunion.participant_debt('Emily')
    assert_equal -10, reunion.participant_debt('Iza')
  end


end
