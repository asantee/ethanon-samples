// Manages keyframe-based animations
class FrameTimer
{
	private uint m_lastTime = 0;
	private uint m_currentFirst = 0;
	private uint m_currentLast = 0;
	private uint m_currentFrame = 0;

	// returns the current frame
	uint getCurrentFrame()
	{
		return m_currentFrame;
	}

	// updates the animation. Call it once per frame
	uint update(const uint first, const uint last, const uint stride)
	{
		if (first != m_currentFirst || last != m_currentLast)
		{
			m_currentFrame = first;
			m_currentFirst = first;
			m_currentLast  = last;
			m_lastTime = GetTime();
			return m_currentFrame;
		}

		if (GetTime() - m_lastTime > stride)
		{
			m_currentFrame++;
			if (m_currentFrame > last)
				m_currentFrame = first;
			m_lastTime = GetTime();
		}

		return m_currentFrame;
	}
}
