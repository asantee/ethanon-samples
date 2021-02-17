class StaticCameraController : CameraController
{
	private vector2 m_cameraMiddlePos;

	void update() override
	{
		// find screent middle point
		m_cameraMiddlePos = GetScreenSize() / 2.0f;
	}

	vector2 getCameraMiddlePos() override
	{
		return m_cameraMiddlePos;
	}
}
