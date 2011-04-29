require 'test/unit'
require 'robot'

class RobotTest < Test::Unit::TestCase
  def setup
    @robot = Robot.new
  end

  def test_create_robot
    assert_not_nil @robot
  end

  def test_learn_to_turn_left
    skill_exercised = false
    @robot.learn_maneuvering('left') { skill_exercised = true }
    @robot.left
    assert skill_exercised
  end

  def test_learn_to_turn_right
    skill_exercised = false
    turn_right = lambda { skill_exercised = true }
    @robot.learn_maneuvering 'right', &turn_right
    @robot.right
    assert skill_exercised
  end      

  def test_learn_a_maneuver_that_takes_one_arg
    value = 0
    @robot.learn_maneuvering('turn') { |degree| value = degree }
    @robot.turn 20
    assert 20, value
  end

  def test_call_a_maneuver_with_one_args_with_no_parameters
    value = 0
    @robot.learn_maneuvering('turn') { |degree| value = degree }
    assert_raise(ArgumentError) { @robot.turn }
  end

  def test_call_a_maneuver_with_one_args_with_two_parameters
    value = 0
    @robot.learn_maneuvering('turn') { |degree| value = degree }
    assert_raise(ArgumentError) { @robot.turn(20, 40) }
  end

  def test_call_a_nonexistent_maneuver
    assert_raise(RuntimeError, "Unknown maneuver") { @robot.run }
  end

  def test_learn_a_maneuver_that_takes_two_arg
    value1, value2 = 0, 0
    @robot.learn_maneuvering('goto') { |lat, lon| value1, value2 = lat, lon }
    @robot.goto(29.97, 95.35)
    assert 29.97, value1
    assert 95.35, value2
  end

  def test_call_a_maneuver_with_two_args_with_no_parameters
    @robot.learn_maneuvering('goto') { |lat, lon| value1, value2 = lat, lon }
    assert_raise(ArgumentError) { @robot.goto }
  end

  def test_call_a_maneuver_with_two_args_with_one_parameters
    @robot.learn_maneuvering('goto') { |lat, lon| value1, value2 = lat, lon }
    assert_raise(ArgumentError) { @robot.goto(1) }
  end

  def test_call_a_maneuver_with_two_args_with_three_parameters
    @robot.learn_maneuvering('goto') { |lat, lon| value1, value2 = lat, lon }
    assert_raise(ArgumentError) { @robot.goto(1, 2, 3) }
  end

  def test_learn_two_skills
    exercised_skill_1 = false
    exercised_skill_2 = false
  	@robot.learn_maneuvering('left') { exercised_skill_1 = true}
  	@robot.learn_maneuvering('turn') { |degree| exercised_skill_2 = true}
    
    @robot.left
    @robot.turn(50)
    
    assert exercised_skill_1
    assert exercised_skill_2
  end

  def test_adding_a_method_to_one_robot_does_not_affect_another
    @robot2 = Robot.new
    value = 0
    @robot2.learn_maneuvering('turn') { |degree| value = degree }
    @robot2.turn 20
    assert 20, value
    assert_raise(RuntimeError, "Unknown maneuver") { @robot.turn(20) }
  end
  
  def test_adding_a_method_to_one_robot_does_not_affect_another_with_same_method
    @robot2 = Robot.new
    value1, value2 = 0, 0
    @robot2.learn_maneuvering('turn') { |degree| value1 = degree }
    @robot.learn_maneuvering('turn') { |degree| value2 = degree}
    @robot2.turn 20
    @robot.turn 50
    assert 20, value1
    assert 50, value2
  end

  def test_provide_an_invalid_maneuver_name
    assert_raise (SyntaxError, RuntimeError) { @robot.learn_maneuvering('1invalid') {} }
  end
end
