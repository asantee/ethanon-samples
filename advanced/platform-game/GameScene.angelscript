#include "Button.angelscript"
#include "Character.angelscript"
#include "MainCharacterController.angelscript"

class GameScene : Scene
{
	private Button@ m_exitButton;
	private Character@ m_character;
	private MainCharacterController m_characterController;

	GameScene()
	{
		const string sceneName = "scenes/platforms.esc";
		super(sceneName);
	}

	void onCreated()
	{
		@m_exitButton = Button("sprites/return_button.png", vector2(0.0f, 0.0f), vector2(0.0f, 0.0f));

		const vector2 screenMiddle(GetScreenSize() * 0.5f);

		AddEntity("background.ent", vector3(screenMiddle, -10.0f));

		@m_character = Character("witch.ent", screenMiddle);
	}

	void onUpdate()
	{
		m_characterController.update();
		m_character.update(@m_characterController);

		m_exitButton.putButton();
		if (m_exitButton.isPressed())
		{
			g_sceneManager.setCurrentScene(MainMenuScene());
		}
	}
}
