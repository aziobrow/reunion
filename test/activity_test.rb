require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def test_it_exists
    activity = Activity.new('code')

    assert_instance_of Activity, activity
  end

  def test_it_has_a_name
    activity = Activity.new('code')

    assert_equal 'code', activity.name
  end

  def test_it_has_participants
    participants = {'Aurora'=>5, 'Aaron'=>10, 'Marshall'=>15}
    activity = Activity.new('code', participants)

    assert_equal ({'Aurora'=>5, 'Aaron'=>10, 'Marshall'=>15}), activity.participants
  end

  def test_it_has_total_cost
    participants = {'Aurora'=>5, 'Aaron'=>10, 'Marshall'=>15}
    activity = Activity.new('code', participants)

    assert_equal 30, activity.total_cost
  end

  def test_it_can_split_cost
    participants = {'Aurora'=>5, 'Aaron'=>10, 'Marshall'=>15}
    activity = Activity.new('code', participants)

    assert_equal 10, activity.split_cost
  end

  def test_it_can_calculate_amount_owed
    participants = {'Aurora'=>5, 'Aaron'=>10, 'Marshall'=>15}
    activity = Activity.new('code', participants)

    assert_equal 5, activity.amount_owed('Aurora')
    assert_equal 0, activity.amount_owed('Aaron')
    assert_equal -5, activity.amount_owed('Marshall')
  end
end
