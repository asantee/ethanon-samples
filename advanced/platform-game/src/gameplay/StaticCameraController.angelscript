class StaticCameraController : CameraController
{
	void update() override
	{
		// since it's a static camera, do nothing
	}

	vector2 getCameraMiddlePos() override
	{
		return vector2(GetScreenSize() / 2.0f);
	}
}
