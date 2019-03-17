#include "AudioRecorder.h"

namespace
{
	void audioCallback(void *data, uint8_t *stream, int size)
	{
		std::ofstream *outFile = reinterpret_cast<std::ofstream*>(data);
		outFile->write(reinterpret_cast<char*>(stream), size);
	}
}

AudioRecorder::AudioRecorder()
{
	if (!init())
	{
		printf("[!] Failed to initialize AudioRecorder\n");
	}
}

AudioRecorder::~AudioRecorder()
{
	stop();
}

bool AudioRecorder::init()
{
	auto filePath = "output.raw";
	outFile.open(filePath, std::ios::binary);

	if (!outFile)
	{
		printf("[!] Couldn't open '%s' for writing. Exiting.\n", filePath);
		return false;
	}

	if (SDL_Init(SDL_INIT_AUDIO) < 0)
	{
		SDL_LogError(SDL_LOG_CATEGORY_APPLICATION, "SDL INIT FAILED: %s\n", SDL_GetError());
		return false;
	}

	if (SDL_GetNumAudioDevices(SDL_TRUE) < 1)
	{
		printf("[!] No default recording device found\n");
		return false;
	}

	printf("[*] Found default recording device '%s'\n", SDL_GetAudioDeviceName(0, SDL_TRUE));

	SDL_AudioSpec captureSpec;
	SDL_zero(captureSpec);

	captureSpec.freq = SampleRate;
	captureSpec.format = AUDIO_F32SYS;
	captureSpec.channels = 1;
	captureSpec.samples = FrameSize;
	captureSpec.callback = audioCallback;
	captureSpec.userdata = (void *)(&outFile);

	SDL_AudioSpec audioSpecs;
	SDL_zero(audioSpecs);

	printf("[*] Opening audio device '%s'\n", SDL_GetAudioDeviceName(0, SDL_TRUE));

	deviceId = SDL_OpenAudioDevice(
		SDL_GetAudioDeviceName(0, SDL_TRUE),
		SDL_TRUE,
		&captureSpec,
		&audioSpecs,
		0);

	if (!deviceId)
	{
		SDL_LogError(SDL_LOG_CATEGORY_APPLICATION, "[!] Error opening audio device: %s!\n", SDL_GetError());
		SDL_Quit();
		return false;
	}

	SDL_PauseAudioDevice(deviceId, 1);

	return true;
}

void AudioRecorder::start()
{
	SDL_PauseAudioDevice(deviceId, 0);
	printf("[*] Recording started\n");
}

void AudioRecorder::stop() noexcept
{
	SDL_CloseAudio();
	outFile.close();
	printf("[*] Recording stopped\n");
}

void AudioRecorder::pause()
{
	SDL_PauseAudioDevice(deviceId, 1);
	printf("[*] Recording paused\n");
}
