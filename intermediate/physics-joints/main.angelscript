void main()
{
	LoadScene("scenes/joint_scene.esc", "", "onSceneUpdate");
}

void onSceneUpdate()
{
	DrawText(vector2(0, 0), "Left/right click to add objects to scene\nArrow keys control motor speed", "Verdana20.fnt", 0xFFFFFFFF);

	ETHInput@ input = GetInputHandle();

	if (input.GetTouchState(0) == KS_HIT)
	{
		AddEntity("box.ent", vector3(input.GetCursorPos(), 0.0f), 0.0f);
	}

	if (input.GetKeyState(K_RMOUSE) == KS_HIT)
	{
		AddEntity("boulder.ent", vector3(input.GetCursorPos(), 0.0f), 0.0f);
	}
}

void ETHCallback_sensor_with_two_joints(ETHEntity@ thisEntity)
{
	ETHPhysicsController@ controller = thisEntity.GetPhysicsController();
	ETHRevoluteJoint@ joint0 = controller.GetRevoluteJoint(0);

	ETHInput@ input = GetInputHandle();

	// on right key press, increase motor speed by 5
	if (input.GetKeyState(K_RIGHT) == KS_HIT)
		joint0.SetMotorSpeed(joint0.GetJointSpeed() + 5.0f);

	// on left key press, decrease motor speed by 5
	if (input.GetKeyState(K_LEFT) == KS_HIT)
		joint0.SetMotorSpeed(joint0.GetJointSpeed() - 5.0f);
}
