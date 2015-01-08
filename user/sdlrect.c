#include "SDL/SDL.h"

int main() {
	// init SDL
	printf("init:%i\n",SDL_Init( SDL_INIT_EVERYTHING ));
//	// start window/fullscreen
//	SDL_Surface* screen = SDL_SetVideoMode( 640, 480, 0, SDL_SWSURFACE );
//	// load hello image
//	SDL_Surface* hello = SDL_LoadBMP( "/share/hello.bmp" );
//	// copy image to screen
//	SDL_BlitSurface( hello, NULL, screen, NULL );
//	// update sdl window
//	SDL_Flip( screen );
//	// delay 3 seconds
//	SDL_Delay( 3000 );
	// quit
	SDL_Quit();
	return 0;
}
