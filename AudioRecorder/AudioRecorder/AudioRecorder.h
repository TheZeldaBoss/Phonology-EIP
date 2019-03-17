#ifndef _AUDIO_RECORDER_H_
#define _AUDIO_RECORDER_H_

#include <SDL.h>
#include <SDL_audio.h>
#pragma comment(lib, "SDL2")

#include <fstream>

namespace
{
	constexpr int64_t FrameSize = 1024;
	static constexpr int64_t SampleRate = 44100;
}

class AudioRecorder
{
public:
	AudioRecorder();
	~AudioRecorder();

	bool init();
	void start();
	void stop() noexcept;
	void pause();

private:
	SDL_AudioDeviceID deviceId;
	std::ofstream outFile;
};

#endif