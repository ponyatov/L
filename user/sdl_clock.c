// force small CarLCD wide screen
//#define DISPLAY_W 640
//#define DISPLAY_H 400
// autodetect
#define DISPLAY_W 0
#define DISPLAY_H 0

#include <SDL/SDL.h>
#include <SDL/SDL_image.h>
#include <SDL/SDL_ttf.h>
#include <SDL/SDL_rotozoom.h>

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>

#define BGTUX "/share/splash640x480.png"

#define WEATHER "/tmp/weather.png"

#define WE_T	"/share/T.png"
#define WE_H	"/share/H.png"

#define FNT "/share/font/Instruction.ttf"

#define FNTDATESZ	33
#define FNTTIMESZ	138
//155

static SDL_Color FNTCLRDATE = {0x00,0xFF,0x00};
static SDL_Color FNTCLRTIME = {0xFF,0x55,0x00};

#define DATEX 0
#define DATEY 0
#define TIMEX 0
#define TIMEY 0
#define WEATHERX 320
#define WEATHERY 400/2-25
#define ROOTX 640
#define ROOTY 480

void SDL_err() {
	SDL_Quit();
	fprintf(stderr, "\nSDL_GetError:%s\n", SDL_GetError());
	abort();
}

void TTF_err() {
	SDL_Quit();
	fprintf(stderr, "\nTTF_GetError:%s\n", TTF_GetError());
	abort();
}

char TSDATE[0x100],TSTIME[0x100];

time_t rawtime;

struct tm * timeinfo;

SDL_Surface *tdate,*ttime;

TTF_Font *fdate, *ftime;

SDL_Event event;

SDL_Surface* root;
SDL_Surface *weather;
SDL_Surface *we_T;
SDL_Surface *we_H;
SDL_Surface *weather2;

SDL_Rect rDATE,rTIME,rWEATHER,rWE_T,rWE_H,rROOT;

int main(int argc, char *argv[]) {
	// get weather on start
	system("/bin/sh /etc/weather.rc");
	// init SDL rectangles
    rDATE.x=DATEX; rDATE.y=DATEY;
    rTIME.x=TIMEX; rTIME.y=TIMEY;
    rWEATHER.x=WEATHERX; rWEATHER.y=WEATHERY;
    rWE_T.x=0; rWE_H.x=0; rWE_T.y=WEATHERY; rWE_H.y=WEATHERY+100;
	// init SDL
	if (SDL_Init(SDL_INIT_VIDEO)) SDL_err();
	// start window/fullscreen
	SDL_Surface* screen = SDL_SetVideoMode(DISPLAY_W, DISPLAY_H, 0, SDL_SWSURFACE);
	//SDL_GetClipRect(screen,&rROOT);
	// hide mouse cursor
	SDL_ShowCursor(0);
	// init ttf
	if (TTF_Init()) TTF_err();
	fdate = TTF_OpenFont(FNT, FNTDATESZ); if (!fdate) TTF_err();
	ftime = TTF_OpenFont(FNT, FNTTIMESZ); if (!ftime) TTF_err();
	// bg bmp update
	root = IMG_Load(BGTUX);
	// wait keypress
	for (int done = 0; done == 0;) {
		// update weather bmp
		weather = IMG_Load(WEATHER);
		we_T = IMG_Load(WE_T);
		we_H = IMG_Load(WE_H);
		//SDL_GetClipRect(weather,&rWEATHER);
		weather2 = zoomSurface(weather,2.5,2.5,0);
		//SDL_GetClipRect(weather,&rWEATHER);
		// fetch date and time
		time(&rawtime);
		timeinfo = localtime(&rawtime);
		strftime(TSDATE, sizeof(TSDATE), "%Y-%m-%d %A", timeinfo);
		strftime(TSTIME, sizeof(TSTIME), "%H:%M:%S", timeinfo);
		// render text
		tdate = TTF_RenderText_Solid(fdate, TSDATE, FNTCLRDATE);
		ttime = TTF_RenderText_Solid(ftime, TSTIME, FNTCLRTIME);
		// flip screen
		SDL_BlitSurface(root,  NULL, screen, NULL);
		SDL_BlitSurface(we_T, NULL, screen, &rWE_T);
		SDL_BlitSurface(we_H, NULL, screen, &rWE_H);
		SDL_BlitSurface(weather2, NULL, screen, &rWEATHER);
		SDL_BlitSurface(tdate, NULL, screen, &rDATE);
		SDL_BlitSurface(ttime, NULL, screen, &rTIME);
		SDL_Flip(screen);
		// fix memory leaks
		SDL_FreeSurface(tdate); SDL_FreeSurface(ttime);
		SDL_FreeSurface(weather); SDL_FreeSurface(weather2);
		SDL_FreeSurface(we_T); SDL_FreeSurface(we_H);
		// wait
		sleep(1);
		// check keypress
		while (SDL_PollEvent(&event)) {
			switch (event.type) {
			case SDL_QUIT:
			case SDL_KEYDOWN:
				done = 1;
			}
		}
	}
	SDL_Quit();
	return 0;
}
