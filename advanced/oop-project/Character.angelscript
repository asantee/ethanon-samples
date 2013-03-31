#include "FrameTimer.angelscript"

class Character
{
	ETHEntity@ m_entity;

	private FrameTimer m_frameTimer;
	private uint m_directionLine = 0;

	Character(const string &in entityName, const vector2 pos)
	{
		AddEntity(entityName, vector3(pos, 0.0f), m_entity);
	}

	void update()
	{
		ETHInput@ input = GetInputHandle();
		vector2 direction(0, 0);

		// find current move direction based on keyboard keys
		if (input.KeyDown(K_DOWN))
		{
			m_directionLine = 0;
			direction += vector2(0, 1);
		}
		if (input.KeyDown(K_LEFT))
		{
			m_directionLine = 1;
			direction += vector2(-1, 0);
		}
		if (input.KeyDown(K_RIGHT))
		{
			m_directionLine = 2;
			direction += vector2(1, 0);
		}
		if (input.KeyDown(K_UP))
		{
			m_directionLine = 3;
			direction += vector2(0,-1);
		}

		// if there's movement, update animation
		if (direction.length() != 0.0f)
			m_frameTimer.update(0, 3, 150);
		else
			m_frameTimer.update(0, 0, 150);

		// update entity
		const float speed = 1.5f;
		const uint currentFrame = m_frameTimer.getCurrentFrame();
		m_entity.AddToPositionXY(normalize(direction) * speed);
		m_entity.SetFrame(currentFrame, m_directionLine);
	}
}
