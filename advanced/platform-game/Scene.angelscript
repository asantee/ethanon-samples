class Scene
{
	private string m_sceneFileName;
	private vector2 m_bucketSize;

	Scene(const string &in sceneFileName, const vector2 bucketSize = vector2(256.0f, 256.0f))
	{
		m_sceneFileName = sceneFileName;
		m_bucketSize = bucketSize;
	}

	vector2 getBucketSize() const
	{
		return m_bucketSize;
	}

	string getSceneFileName() const
	{
		return m_sceneFileName;
	}

	void onCreated() { }
	void onUpdate() { }
	void onResume() { }
}
