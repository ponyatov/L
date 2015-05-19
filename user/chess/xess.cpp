#include <windows.h>

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include <SDL/SDL.h>
#include <SDL/SDL_image.h>
#include <SDL/SDL_ttf.h>

FILE *log=fopen("log","w");

typedef enum {
	WK, // king korol
	WQ, // queen ferz
	WR, // rook ladya
	WN, // kNight kon
	WB, // bishop slon
	WP,  // pawn peshka
	BK, // king korol
	BQ, // queen ferz
	BR, // rook ladya
	BN, // kNight kon
	BB, // bishop slon
	BP,  // pawn peshka
	WC,
	BC,
	CC
} FIGURE;
	
char BOARD[]={
	BR,BN,BB,BQ,BK,BB,BN,BR,
	BP,BP,BP,BP,BP,BP,BP,BP,
	CC,CC,CC,CC,CC,CC,CC,CC,
	CC,CC,CC,CC,CC,CC,CC,CC,
	CC,CC,CC,CC,CC,CC,CC,CC,
	CC,CC,CC,CC,CC,CC,CC,CC,
	WP,WP,WP,WP,WP,WP,WP,WP,
	WR,WN,WB,WQ,WK,WB,WN,WR
};

// load SDL resources

SDL_Surface* FIG[]={
		// white figures
		IMG_Load("xboard/png/WhiteKing.png"),
		IMG_Load("xboard/png/WhiteQueen.png"),
		IMG_Load("xboard/png/WhiteRook.png"),
		IMG_Load("xboard/png/WhiteKnight.png"),
		IMG_Load("xboard/png/WhiteBishop.png"),
		IMG_Load("xboard/png/WhitePawn.png"),
		// black figures
		IMG_Load("xboard/png/BlackKing.png"),
		IMG_Load("xboard/png/BlackQueen.png"),
		IMG_Load("xboard/png/BlackRook.png"),
		IMG_Load("xboard/png/BlackKnight.png"),
		IMG_Load("xboard/png/BlackBishop.png"),
		IMG_Load("xboard/png/BlackPawn.png"),
		// empty cells
		IMG_Load("xboard/png/WC.png"),
		IMG_Load("xboard/png/BC.png")
};
const uint8_t FIGsz = sizeof(FIG)/sizeof(FIG[0]);

SDL_Surface* icon	= IMG_Load("xboard/png/WhitePrincess.png");
SDL_Surface* bg 	= SDL_LoadBMP("chess.bmp");
SDL_Surface* scr;

SDL_Rect rect;

SDL_Event event;

TTF_Font *font = NULL;

bool QUIT=0;

void DrawBoard(void) {
	// blit board
	int x,y; SDL_Surface* f;
	for (int i = 0; i < sizeof(BOARD); i++) {
		x=i%8; y=i/8;
		if ((i+y)%2) f=FIG[BC]; else f=FIG[WC];
		rect.w=f->w; rect.h=f->h;
		rect.x=x*rect.w+rect.w/2; rect.y=y*rect.h+rect.h/2;
		SDL_BlitSurface(f, NULL, scr, &rect);
		if (BOARD[i]!=CC)
			SDL_BlitSurface(FIG[BOARD[i]], NULL, scr, &rect);
	}
// Update Screen
	SDL_Flip(scr);
}

int WINAPI WinMain (HINSTANCE, HINSTANCE, LPSTR, int)
{
	// check preloaded resources
	assert(icon!=NULL);
	assert(bg!=NULL);
	for (uint8_t i=0;i<FIGsz;i++) assert(FIG[i]!=NULL);
	//Start SDL
	assert(SDL_Init(SDL_INIT_VIDEO)==0);
	// load font subsystem
	assert(TTF_Init()==0);
	font=TTF_OpenFont( "MERIFONT.TTF", 28 ); assert(font!=0);
	// init scr
	scr = SDL_SetVideoMode( 800, 600, 16, SDL_SWSURFACE ); assert(scr!=NULL);
	// draw board
	DrawBoard();
	// event loop
	while (!QUIT) {
		SDL_Delay( 100 );
		while (SDL_PollEvent( &event )) {
			if (event.type==SDL_QUIT)
				QUIT=1;
		}
	}
	// Quit SDL
	SDL_FreeSurface(icon);
	SDL_FreeSurface(bg);
	for (uint8_t i=0;i<FIGsz;i++) SDL_FreeSurface(FIG[i]);
	SDL_Quit();
	// fake return
	fclose(log);
	return 0;
}
