#include "Recorder.h"

int main()
{
	Recorder r1;

	r1.start();

	while (true)
	{
		Pa_Sleep(100);
	}
}