//check horizontal and vertical collision with collsion layer, then destroy if colliding
if( (place_meeting(self.x + xVelocity, self.y, collision_layer())) || (place_meeting(self.x, self.y + yVelocity, collision_layer()) )) {
	instance_destroy(self)
}

self.x += xVelocity
self.y += yVelocity

