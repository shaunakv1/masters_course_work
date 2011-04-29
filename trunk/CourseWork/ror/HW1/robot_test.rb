require 'test/unit'
require 'robot'

class RobotTest < Test::Unit::TestCase
  def setup
    @robot = Robot.new
    @robot2=Robot.new
  end
  
  def test_learn_to_turn_left
    exercised_skill = false
    @robot.learn_maneuvering('left') { puts "turn left"; exercised_skill = true}
    
    @robot.left
    assert exercised_skill
  end
  
  def test_learn_to_turn_right
    exercised_skill = false
    turn_right = lambda { puts "turn right"; exercised_skill = true}
    @robot.learn_maneuvering('right', &turn_right)
    
    @robot.right
    assert exercised_skill
  end
  
  def test_learn_two_skills
    exercised_skill_1 = false
    exercised_skill_2 = false
    @robot.learn_maneuvering('left') { puts "turn left"; exercised_skill_1 = true}
    @robot.learn_maneuvering('turn') { |degree| puts "turning #{degree} degrees"; exercised_skill_2 = true}
    
    @robot.left
    @robot.turn(50)
    
    assert exercised_skill_1
    assert exercised_skill_2
  end
  
  def test_exercise_unknown_skill
    assert_raise(RuntimeError, "Unknown maneuver") { @robot.run }
  end
  
  def test_ensure_isolated_robots
    @robot.learn_maneuvering('left') { puts "turn left"}
    assert_raise(RuntimeError, "Unknown maneuver") { @robot2.left }
  end
  
  def test_ensure_correct_number_of_arguements
    @robot.learn_maneuvering('turn') { |degree| puts "turning #{degree} degrees"}
    assert_raise(RuntimeError, "Insufficiant Arguements passed") {@robot.turn() } 
  end
  
  def test_ensure_block_provided
    assert_raise(RuntimeError, "no method block provided") {@robot.learn_maneuvering('turn')}  
  end
  
  def test_excercise_incorrect_conventions
    assert_raise(RuntimeError, "Incorrect Method Name") {@robot.learn_maneuvering('le ft'){puts "turn_left"} }
    assert_raise(RuntimeError, "Incorrect Method Name") {@robot.learn_maneuvering('TurnLeft'){puts "TurnLeft"} }
    assert_raise(RuntimeError, "Incorrect Method Name") {@robot.learn_maneuvering('t@ur=n'){puts "TurnLeft"} }
    assert_raise(RuntimeError, "Incorrect Method Name") {@robot.learn_maneuvering('turn.left'){puts "TurnLeft"} }
  end
  
  def test_excercise_correct_conventions
    assert_nothing_raised(){ @robot.learn_maneuvering('turn_left'){puts "turn_left"} }
    assert_nothing_raised(){ @robot.learn_maneuvering('turn_left='){puts "turn_left"} }
    assert_nothing_raised(){ @robot.learn_maneuvering('turn_left!'){puts "turn_left"} }
    assert_nothing_raised(){ @robot.learn_maneuvering('turn_left?'){puts "turn_left"}} 
    assert_nothing_raised(){ @robot.learn_maneuvering('left'){puts "turn_left"} }
  end
  
  
end
