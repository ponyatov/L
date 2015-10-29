#define SPLASH_DELAY 1000

#include "SDL/SDL.h"

int main() {
	// init SDL
	if (SDL_Init(SDL_INIT_VIDEO)) { // SDL_INIT_EVERYTHING)) {
		fprintf(stderr,"\nSDL_GetError: %s\n",SDL_GetError());
		abort();
	}
	// start window/fullscreen
	SDL_Surface* screen = SDL_SetVideoMode(   0,   0, 0, SDL_SWSURFACE );
	// hide mouse cursor
	SDL_ShowCursor(0);
	// load hello image
	SDL_Surface* hello = SDL_LoadBMP( "/share/hello.bmp" );
	// copy image to screen
	SDL_BlitSurface( hello, NULL, screen, NULL );
	// update sdl window
	SDL_Flip( screen );
	// delay 5 seconds
	SDL_Delay( SPLASH_DELAY );
	// quit
	SDL_Quit();
	return 0;
}
