//#include <stdio.h>
//#include <stdlib.h>
//#include <unistd.h>
#include <assert.h>
//#include <time.h>

#include <SDL/SDL.h>

int main() {
	srand(time(0));
	if (SDL_Init(SDL_INIT_VIDEO)) {
		fprintf(stderr,"\nSDL_GetError:%s\n",SDL_GetError());
		abort();
	}
	SDL_Surface* screen = SDL_SetVideoMode(0, 0, 0, SDL_HWSURFACE);
	assert(screen!=NULL);
	SDL_Rect rect = screen->clip_rect;
	int R,G,B,X,Y,U,V;
	SDL_Rect quad;

	SDL_FillRect(screen,&screen->clip_rect,
			SDL_MapRGB(screen->format,0,0,0));
	SDL_Flip(screen);

    // wait keypress
    SDL_Event event;
    int done=0;
    for (done=0;done==0;) {
		R=rand()%0x100;	G=rand()%0x100;	B=rand()%0x100;
		X=rand()%rect.w; Y=rand()%rect.h;
		U=rand()%rect.w; V=rand()%rect.h;
		quad.x=X; quad.y=Y; quad.w=U; quad.h=V;
		SDL_FillRect(screen,&quad,SDL_MapRGB(screen->format,R,G,B));
		SDL_Flip(screen);
    while (SDL_PollEvent(&event)) {
        switch (event.type) {
            case SDL_QUIT:
            case SDL_KEYDOWN:
                done=1;
        }
    }
    }
    SDL_Quit();
    return 0;
}
