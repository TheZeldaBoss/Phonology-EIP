#include "AudioRecorder.h"

int main(int argc, char **argv)
{
	AudioRecorder audioRecorder;

	audioRecorder.start();

	while (true)
		SDL_Delay(1000);

	return 0;
}