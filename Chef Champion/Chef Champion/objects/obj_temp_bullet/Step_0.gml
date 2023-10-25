/// @description Insert description here
// You can write your code in this editor

x += xVelocity
y += yVelocity

if(place_meeting(self.x + self.xVelocity, self.y, collision_layer())){
	instance_destroy(self)
}

