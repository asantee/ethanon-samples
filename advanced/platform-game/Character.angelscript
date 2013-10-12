#include "FrameTimer.angelscript"
#include "CharacterController.angelscript"

class Character
{
	ETHEntity@ m_entity;

	private FrameTimer m_frameTimer;
	private uint m_directionLine = 1;

	Character(const string &in entityName, const vector2 pos)
	{
		AddEntity(entityName, vector3(pos, -2.0f), m_entity);
	}

	void update(CharacterController@ characterController)
	{
		ETHPhysicsController@ physicsController = m_entity.GetPhysicsController();

		updateMovement(@physicsController, characterController.getMovementSpeed());
		updateJumpImpulse(@physicsController, characterController.getJumpImpulse());

		// update entity animation frame
		const uint currentFrame = m_frameTimer.getCurrentFrame();
		m_entity.SetFrame(currentFrame, m_directionLine);
	}

	void updateMovement(ETHPhysicsController@ physicsController, const float movementSpeed)
	{
		// if there's movement, update animation
		if (movementSpeed != 0.0f)
		{
			// apply movement horizontally, keeping current vertical velocity (let gravity work alone)
			const vector2 currentVelocity = physicsController.GetLinearVelocity();
			physicsController.SetLinearVelocity(vector2(movementSpeed, currentVelocity.y));
			m_frameTimer.update(0, 3, 150);

			// find correct row in sprite sheet depending on direction
			m_directionLine = movementSpeed > 0 ? 2 : 1;
		}
		else
		{
			// if theres no horizontal movement, break character
			const vector2 currentVelocity = physicsController.GetLinearVelocity();
			physicsController.SetLinearVelocity(vector2(0.0f, currentVelocity.y));
		}
	}

	void updateJumpImpulse(ETHPhysicsController@ physicsController, const float jumpImpulse)
	{
		// apply jump impulse
		if (jumpImpulse != 0.0f)
		{
			// apply jump impulse leaving horizontal speed as it is
			const vector2 currentVelocity = physicsController.GetLinearVelocity();
			physicsController.SetLinearVelocity(vector2(currentVelocity.x, jumpImpulse));
		}
	}
}
