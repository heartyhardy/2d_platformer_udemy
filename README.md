# 2D platformer Udemy course
[Udemy course](https://www.udemy.com/course/create-a-complete-2d-platformer-in-the-godot-engine/)

-----

### Day 1: Project Setup

### Day 2: Basic Movement

### Day 3: Fluid movement and Jump

- Always go for tight jump and movement controls
- Add 2-3 frames of acceleration
- If Jump is floaty, dramatically increase Jump speed and Gravity
- Choose frame independent Lerp
- Jump should be variable (When just pressed and when held)
- Jump should be around 3 tiles of height

### Day 4: Auto-Tiling, Camera follow and smoothing
- Added Frame independed Lerp for camera smoothing
- Jittery in "Viewport" Window mode
- Use [this](https://youtu.be/zxVQsi9wnw8) tutorial to implement a better camera follow with smoothing

### Day 5: Animations, Character orientation and Coyote timer
- Make sure to store ```is_on_floor()``` before ```move_and_slide()``` as it changes is_on_floor() internally
- Check if character "was" on floor and ```!is_on_floor()``` to enable Coyote timer
- Enable jumping if ```is_on_floor || !$CoyotoeTimer.is_stopped()```

### Day 6: Added Double Jump
- When ```is_on_floor()``` is true, enable the double jump
```gdscript
	if(move_vec.y < 0 && (is_on_floor() || !$CoyoteTimer.is_stopped() || enable_double_jump)):
		velocity.y = move_vec.y  * max_jump_speed
		if(!is_on_floor() && $CoyoteTimer.is_stopped()):
			enable_double_jump = false
		$CoyoteTimer.stop() #without this, player can't double jump if coyote timer is high
```
- ```if(!is_on_floor() && $CoyoteTimer.is_stopped()):``` will check if player has already double jumped
- Stop the Coyote Timer right after to avoid not being able to double jump when Coyote timer is high
