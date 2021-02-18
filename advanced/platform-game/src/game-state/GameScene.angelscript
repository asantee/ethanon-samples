class GameScene : Scene
{
	private Button@ m_exitButton;
	private Character@ m_character;
	private MainCharacterController m_characterController;
	private CameraController@ m_cameraController;

	GameScene()
	{
		const string sceneName = "scenes/platforms.esc";
		super(sceneName);
	}

	void onCreated() override
	{
		@m_exitButton = Button("sprites/return_button.png", vector2(0.0f, 0.0f), vector2(0.0f, 0.0f));

		const vector2 screenMiddle(GetScreenSize() * 0.5f);

		AddEntity("background.ent", vector3(screenMiddle, -10.0f));

		@m_character = Character("witch.ent", screenMiddle);

		@m_cameraController = CharacterCameraController(@m_character);
	}

	void onUpdate() override
	{
		m_characterController.update();
		m_character.update(@m_characterController);

		m_cameraController.update();
		SetCameraPos(m_cameraController.getCameraMiddlePos() - (GetScreenSize() / 2.0f));

		m_exitButton.putButton();
		if (m_exitButton.isPressed())
		{
			g_sceneManager.setCurrentScene(MainMenuScene());
		}
	}
}
