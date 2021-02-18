class CharacterCameraController : CameraController
{
	private Character@ m_character;
	private vector2 m_cameraMiddlePos;

	CharacterCameraController(Character@ character)
	{
		@m_character = @character;
	}

	void update() override
	{
		m_cameraMiddlePos = m_character.getPosition();
	}

	vector2 getCameraMiddlePos() override
	{
		return m_cameraMiddlePos;
	}
}
