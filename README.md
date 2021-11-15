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
