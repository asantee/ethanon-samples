#include "FrameTimer.angelscript"
#include "CharacterController.angelscript"

class Character
{
	ETHEntity@ m_entity;

	private FrameTimer m_frameTimer;
	private uint m_directionLine = 1;
	private uint m_frameColumn = 0;
	private bool m_touchingGround = false;

	Character(const string &in entityName, const vector2 pos)
	{
		// add character entity and rename it to "character" for matching character-
		// specific entity callback functions
		const int id = AddEntity(entityName, vector3(pos, -2.0f), "Character");
		@m_entity = SeekEntity(id);
	}

	void update(CharacterController@ characterController)
	{
		ETHPhysicsController@ physicsController = m_entity.GetPhysicsController();

		// never let character body sleep
		physicsController.SetAwake(true);

		checkGroundTouch();
		updateMovement(@physicsController, characterController.getMovementSpeed());
		updateJumpImpulse(@physicsController, characterController.getJumpImpulse());

		// update entity animation frame
		m_entity.SetFrame(m_frameColumn, m_directionLine);
	}

	bool isTouchingGround() const
	{
		return m_touchingGround;
	}

	private void updateMovement(ETHPhysicsController@ physicsController, const float movementSpeed)
	{
		// if there's movement, update animation
		if (movementSpeed != 0.0f)
		{
			// apply movement horizontally, keeping current vertical velocity (let gravity work alone)
			const vector2 currentVelocity = physicsController.GetLinearVelocity();
			physicsController.SetLinearVelocity(vector2(movementSpeed, currentVelocity.y));

			// animate character by iterating the sprite sheet columns
			m_frameColumn = m_frameTimer.update(0, 3, 150);

			// find correct row in sprite sheet depending on direction
			m_directionLine = movementSpeed > 0 ? 2 : 1;
		}
		else
		{
			// if theres no horizontal movement, break character
			const vector2 currentVelocity = physicsController.GetLinearVelocity();
			physicsController.SetLinearVelocity(vector2(0.0f, currentVelocity.y));

			// idle animation frame (first column in sprite sheet)
			m_frameColumn = 0;
		}
	}

	private void updateJumpImpulse(ETHPhysicsController@ physicsController, const float jumpImpulse)
	{
		const vector2 currentVelocity = physicsController.GetLinearVelocity();

		// apply jump impulse
		if (isTouchingGround())
		{
			if (jumpImpulse != 0.0f)
			{
				// apply jump impulse leaving horizontal speed as it is
				physicsController.SetLinearVelocity(vector2(currentVelocity.x, jumpImpulse));
			}
		}
		else
		{
			// jump animation
			if (currentVelocity.y < 0.0f)
				m_frameColumn = 2;
			else
				m_frameColumn = 1;
		}
	}

	private void checkGroundTouch()
	{
		// if the last time a ground touch had been detected was over a few
		// milliseconds ago, we assume it is no longer touching the ground 
		m_touchingGround = ((GetTime() - m_entity.GetUInt("touchingGroundTime")) < 120);
	}
}

/*
	This function is called when there's contact between the character and anything else.
	It will be used to check if the character's feet touch any ground and set a flag as
	entity data for later use.
*/
void ETHPreSolveContactCallback_Character(
	ETHEntity@ body,
	ETHEntity@ other,
	vector2 contactPointA,
	vector2 contactPointB,
	vector2 contactNormal)
{
	const float charBodyHeight = body.GetCollisionBox().size.y * body.GetScale().y;
	const float halfCharBodyHeight = charBodyHeight / 2.0f;

	// if the contact is near the bottom of the character's body,
	// we can assume it's their feet so he might be touching ground
	if (contactPointA.y > body.GetPositionY() + (halfCharBodyHeight * 0.8f))
	{
		body.SetUInt("touchingGroundTime", GetTime());
	}
}
