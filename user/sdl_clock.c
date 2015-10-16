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

#define WEATHER "/tmp/weather/meteonova.png"

#define WE_T	"/tmp/weather/T.png"
#define WE_H	"/tmp/weather/H.png"
#define WE_P	"/tmp/weather/P.png"

#define CURR_USD	"/tmp/currency/USD"
#define CURR_EUR	"/tmp/currency/EUR"

#define FNT "/share/font/Instruction.ttf"

#define FNTDATESZ	33
#define FNTTIMESZ	FNTDATESZ*3
#define FNTSECSZ	FNTTIMESZ/3
#define FNTCURRSZ	22

static SDL_Color FNTCLRDATE = {0x00,0xFF,0x00};
static SDL_Color FNTCLRTIME = {0xFF,0x55,0x00};
static SDL_Color FNTCLRSEC  = {0x00,0xAA,0xFF};

static SDL_Color FNTCLREUR  = {0xFF,0xAA,0x00};
static SDL_Color FNTCLRUSD  = {0xAA,0xFF,0x00};

#define ROOTX 640
#define ROOTY 480
#define DATEX 0
#define DATEY 0
#define TIMEX ROOTX/2+20
#define TIMEY 0
#define SECX  ROOTX/2+140
#define SECY  FNTDATESZ/2
#define WEATHERX 340
#define WEATHERY 400/2-25
#define CURRX TIMEX+FNTCURRSZ*3
#define CURRY WEATHERY-50

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

char TSDATE[0x100],TSTIME[0x100],TSSEC[0x100],TSUSD[0x100],TSEUR[0x100];

time_t rawtime;

struct tm * timeinfo;

SDL_Surface *tdate,*ttime,*tsec, *tcurr_usd, *tcurr_eur;

TTF_Font *fdate, *ftime, *fsec, *fcurr;

SDL_Event event;

SDL_Surface* root;
SDL_Surface *weather;
SDL_Surface *we_T;
SDL_Surface *we_H;
SDL_Surface *we_P;
SDL_Surface *weather2;

SDL_Rect rDATE,rTIME,rSEC,rWEATHER,rWE_T,rWE_H,rWE_P,rROOT,rCURR_USD,rCURR_EUR;

FILE *usdfh;  FILE *eurfh;

int main(int argc, char *argv[]) {
	// init SDL rectangles
    rDATE.x=DATEX; rDATE.y=DATEY;
    rTIME.x=TIMEX; rTIME.y=TIMEY;
    rSEC.x=SECX; rSEC.y=SECY;
    rWEATHER.x=WEATHERX; rWEATHER.y=WEATHERY;
    rWE_T.x=0; rWE_H.x=0; rWE_P.x=0;
    rWE_P.y=50;
    rWE_H.y=rWE_P.y+120;
    rWE_T.y=rWE_H.y+120;
    rCURR_USD.x=CURRX; rCURR_EUR.x=CURRX;
    rCURR_USD.y=CURRY; rCURR_EUR.y=CURRY+FNTCURRSZ;
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
	fsec  = TTF_OpenFont(FNT, FNTSECSZ);  if (!ftime) TTF_err();
	fcurr = TTF_OpenFont(FNT, FNTCURRSZ);  if (!ftime) TTF_err();
	// bg bmp update
	root = IMG_Load(BGTUX);
	// wait keypress
	for (int done = 0; done == 0;) {
		// update weather bmp
		weather = IMG_Load(WEATHER);
		we_T = IMG_Load(WE_T);
		we_H = IMG_Load(WE_H);
		we_P = IMG_Load(WE_P);
		//SDL_GetClipRect(weather,&rWEATHER);
		weather2 = zoomSurface(weather,2.5,2.5,0);
		//SDL_GetClipRect(weather,&rWEATHER);
		// fetch date and time
		time(&rawtime);
		timeinfo = localtime(&rawtime);
		strftime(TSDATE, sizeof(TSDATE), "%Y-%m-%d %A", timeinfo);
		strftime(TSTIME, sizeof(TSTIME), "%H:%M", timeinfo);
		strftime(TSSEC, sizeof(TSSEC), "%S", timeinfo);
		// render text
		tdate = TTF_RenderText_Solid(fdate, TSDATE, FNTCLRDATE);
		ttime = TTF_RenderText_Solid(ftime, TSTIME, FNTCLRTIME);
		tsec  = TTF_RenderText_Solid(fsec,  TSSEC,  FNTCLRSEC);
		// render currency
		if (usdfh = fopen(CURR_USD,"r")) {
			fread(TSUSD,sizeof(TSUSD),1,usdfh); fclose(usdfh);
		}
		tcurr_usd = TTF_RenderText_Solid(fcurr,  TSUSD,  FNTCLRUSD);
		if (eurfh = fopen(CURR_EUR,"r")) {
			fread(TSEUR,sizeof(TSEUR),1,eurfh); fclose(eurfh);
		}
		tcurr_eur = TTF_RenderText_Solid(fcurr,  TSEUR,  FNTCLREUR);
		// flip screen
		SDL_BlitSurface(root,  NULL, screen, NULL);
		SDL_BlitSurface(we_T, NULL, screen, &rWE_T);
		SDL_BlitSurface(we_H, NULL, screen, &rWE_H);
		SDL_BlitSurface(we_P, NULL, screen, &rWE_P);
		SDL_BlitSurface(weather2, NULL, screen, &rWEATHER);
		SDL_BlitSurface(tdate, NULL, screen, &rDATE);
		SDL_BlitSurface(ttime, NULL, screen, &rTIME);
		SDL_BlitSurface(tsec,  NULL, screen, &rSEC);
		SDL_BlitSurface(tcurr_usd,  NULL, screen, &rCURR_USD);
		SDL_BlitSurface(tcurr_eur,  NULL, screen, &rCURR_EUR);
		SDL_Flip(screen);
		// fix memory leaks
		SDL_FreeSurface(tdate); SDL_FreeSurface(ttime); SDL_FreeSurface(tsec);
		SDL_FreeSurface(weather); SDL_FreeSurface(weather2);
		SDL_FreeSurface(we_T);
		SDL_FreeSurface(we_H);
		SDL_FreeSurface(we_P);
		SDL_FreeSurface(tcurr_usd);
		SDL_FreeSurface(tcurr_eur);
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
