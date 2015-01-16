#include <SDL/SDL.h>

//#include <stdio.h>
//#include <stdlib.h>
//#include <assert.h>
//#include <time.h>
//#include <unistd.h>
//#ifdef WIN32
//#include <windows.h>
//#endif // WIN32
//
//#include <SDL/SDL_ttf.h>
//
//#ifdef WIN32
//    #define SX 640
//    #define SY 480
//    #define SB 24
//	#define BGTUX "/w/cross/share/wallpaper/SpaceTux.bmp"
//	#define FNT "/w/cross/share/font/Instruction.ttf"
//#else
//    #define SX 0
//    #define SY 0
//    #define SB 0
//	#define BGTUX "/share/wallpaper/SpaceTux.bmp"
//	#define FNT "/share/font/Instruction.ttf"
//#endif
//	#define FNTDATESZ 33
//	#define FNTTIMESZ 66
//	#define FNTCALSZ 11
//
//static SDL_Color FNTCLRDATE = {0x00,0xFF,0x00};
//static SDL_Color FNTCLRTIME = {0xFF,0x55,0x00};
//
//#define DATEX 20
//#define DATEY 10
//#define TIMEX 20
//#define TIMEY 390
//#define CALX 200
//#define CALY 20
//
//void SDL_err() {
//        fprintf(stderr,"\nSDL_GetError:%s\n",SDL_GetError());
//        abort();
//}
//
//void TTF_err() {
//}
//
//void wait() {
//    #ifdef WIN32
//    Sleep(1000);
//    #else
//    sleep(1);
//    #endif // WIN32
//}
//
//char TSDATE[0x100],TSTIME[0x100],TSCAL[0x1000];
//time_t rawtime;
//struct tm * timeinfo;
//
//SDL_Surface *tdate,*ttime,*tcal;
//SDL_Surface *screen;
//TTF_Font *fdate,*ftime,*fcal;
//SDL_Event event;
//
//SDL_Rect rDATE,rTIME,rCAL;

int main(int argc, char *argv[]) {
//    rDATE.x=DATEX; rDATE.y=DATEY;
//    rTIME.x=TIMEX; rTIME.y=TIMEY;
//    rCAL.x=CALX; rCAL.y=CALY;
	// init SDL
	if (SDL_Init(SDL_INIT_VIDEO)) { // SDL_INIT_EVERYTHING)) {
		fprintf(stderr,"\nSDL_GetError: %s\n",SDL_GetError());
		abort();
	}
	// start window/fullscreen
	SDL_Surface* screen = SDL_SetVideoMode( 640, 480, 0, SDL_SWSURFACE );
	// hide mouse cursor
	SDL_ShowCursor(0);
    // init ttf
    if (TTF_Init()) {
    	fprintf(stderr,"\nTTF_GetError:%s\n",TTF_GetError());
    	abort();
    }
//    fdate = TTF_OpenFont(FNT, FNTDATESZ); if (!fdate) TTF_err();
//    ftime = TTF_OpenFont(FNT, FNTTIMESZ); if (!ftime) TTF_err();
//    fcal  = TTF_OpenFont(FNT, FNTCALSZ); if (!fcal ) TTF_err();
//    // bg bmp
//    SDL_Surface *root = SDL_LoadBMP(BGTUX); if (!root) SDL_err();
////    // get calendar
////    system("cal > /tmp/cal");
////    FILE *calf=fopen("/tmp/cal","rb"); fread(TSCAL,1,sizeof(TSCAL),calf); fclose(calf);
////    tcal = TTF_RenderText_Solid(fcal,TSCAL,FNTCLRTIME); if (!tcal) TTF_err();
//    // wait keypress
//    for (int done=0;done==0;) {
//    // fetch date and time
//    time (&rawtime); timeinfo = localtime (&rawtime);
//    strftime(TSDATE,sizeof(TSDATE),"%Y-%m-%d %A",timeinfo);
//    strftime(TSTIME,sizeof(TSTIME),"%H:%M:%S",timeinfo);
//    // render text
//    tdate = TTF_RenderText_Solid(fdate,TSDATE,FNTCLRDATE); if (!tdate) TTF_err();
//    ttime = TTF_RenderText_Solid(ftime,TSTIME,FNTCLRTIME); if (!ttime) TTF_err();
//    // flip screen
//    SDL_BlitSurface(root,NULL,screen,NULL);
//    SDL_BlitSurface(tdate,NULL,screen,&rDATE);
//    SDL_BlitSurface(ttime,NULL,screen,&rTIME);
////    SDL_BlitSurface(tcal,NULL,screen,&rCAL);
//    SDL_Flip(screen);
//    // wait
//    wait();
//    // check keypress
//    while (SDL_PollEvent(&event)) {
//        switch (event.type) {
//            case SDL_QUIT:
//            case SDL_KEYDOWN:
//                done=1;
//        }
//    }
//    }
//    SDL_Quit();
    return 0;
}
