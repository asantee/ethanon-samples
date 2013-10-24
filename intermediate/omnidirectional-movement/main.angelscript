/*
	This example takes the "shooting-spaceship" code and assign
	the left and right keys to rotate the ship and up and down
	keys do move it forward and backwards depending on current
	direction.
*/

void main()
{
	LoadScene("scenes/scene.esc");
}

// Receives a vector and an angle value in radians and returns the rotated vector
vector2 rotate(const vector2 &in p, const float angleRad)
{
	return vector2(
		p.x * cos(angleRad) + p.y * sin(angleRad),
	  - p.x * sin(angleRad) + p.y * cos(angleRad));
}

// Controls the ship
void ETHCallback_ship(ETHEntity@ thisEntity)
{
	ETHInput@ input = GetInputHandle();

	// computes the distance our ship must move in order to keep
	// a speed of 60 pixels per second
	float speed = UnitsPerSecond(120.0f);
	float angleSpeed = UnitsPerSecond(160.0f);

	vector2 direction(0.0f,-1.0f);

	if (input.KeyDown(K_RIGHT))
	{
		thisEntity.AddToAngle(-angleSpeed);
	}

	if (input.KeyDown(K_LEFT))
	{
		thisEntity.AddToAngle(angleSpeed);
	}

	// compute rotation vector and do movement
	direction = rotate(direction, degreeToRadian(thisEntity.GetAngle()));

	if (input.KeyDown(K_UP))
	{
		thisEntity.AddToPositionXY(direction * speed);
	}

	if (input.KeyDown(K_DOWN))
	{
		thisEntity.AddToPositionXY(direction *-speed);
	}
}
