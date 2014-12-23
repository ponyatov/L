#include "SDL/SDL.h"
#include "SDL/SDL_image.h"

int main() {
	// init SDL
	SDL_Init( SDL_INIT_EVERYTHING );
	// init SDL_image
	IMG_Init( IMG_INIT_PNG );
	// start window/fullscreen
	SDL_Surface* screen = SDL_SetVideoMode( 640, 480, 0, SDL_SWSURFACE );
	// load hello image
	SDL_Surface* hello = IMG_Load( "/share/hello.png" );
	// copy image to screen
	SDL_BlitSurface( hello, NULL, screen, NULL );
	// update sdl window
	SDL_Flip( screen );
	// delay 3 seconds
	SDL_Delay( 3000 );
	// quit
	SDL_Quit();
	return 0;
}
