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
	ZZ
} FIGURE;
	
char BOARD[]={
	BR,BN,BB,BQ,BK,BB,BN,BR,
	BP,BP,BP,BP,BP,BP,BP,BP,
	ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
	ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
	ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
	ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,ZZ,
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
const char FIGsz = sizeof(FIG)/sizeof(FIG[0]);

SDL_Surface* icon	= IMG_Load("xboard/png/WhitePrincess.png");
SDL_Surface* bg 	= SDL_LoadBMP("chess.bmp");
SDL_Surface* scr;

SDL_Rect rect;

SDL_Event event;

TTF_Font *font = NULL;
SDL_Surface* msg=NULL;
SDL_Color clrmsg={0xA0,0xF0,0xA0};

void ass( int x, int y,
		SDL_Surface* source, SDL_Surface* destination)//,
//		SDL_Rect* clip = NULL )
{
	// Holds offsets
	SDL_Rect offset;
	// Get offsets
	offset.x = x; offset.y = y;
	// Blit
	SDL_BlitSurface( source, NULL, destination, &offset );
}

void DrawBoard(void) {
	// blit board
	int x,y; SDL_Surface* f;
	for (char i = 0; i < sizeof(BOARD); i++) {
		// chess col/row
		x=i%8; y=i/8;
		// get cell draw offset in pixels
		rect.x=x*rect.w+rect.w/2; rect.y=y*rect.h+rect.h/2;
		// blit black/white empty cell
		if ((i+y)%2) f=FIG[BC]; else f=FIG[WC];
		SDL_BlitSurface(f, NULL, scr, &rect);
		// blit figure if cell not empty
		if (BOARD[i]!=ZZ) SDL_BlitSurface(FIG[BOARD[i]], NULL, scr, &rect);
	}
	// apply texts
	ass(0,0,msg,scr);
	// Update Screen
	SDL_Flip(scr);
}

int WINAPI WinMain (HINSTANCE, HINSTANCE, LPSTR, int)
{
	// check preloaded resources
	assert(icon!=NULL);
	assert(bg!=NULL);
	for (char i=0;i<FIGsz;i++) assert(FIG[i]!=NULL);
	//Start SDL
	assert(SDL_Init(SDL_INIT_VIDEO)==0);
	// load font subsystem
	assert(TTF_Init()==0);
	font=TTF_OpenFont( "TTF/WhiteRabbit.ttf", 18 ); assert(font!=0);
	msg=TTF_RenderText_Solid( font, "sdlBoard: CHESS engine GUI for SSAU Linux", clrmsg);
	assert(msg!=NULL);
	// init scr
	scr = SDL_SetVideoMode( 800, 600, 8, SDL_SWSURFACE ); assert(scr!=NULL);
	SDL_WM_SetCaption( "sdlBoard: CHESS", NULL );
	// update drawing rect with & height to figure sizes
	rect.w=FIG[0]->w; rect.h=FIG[0]->h;
	// draw board
	DrawBoard();
	// event loop
	for (char F_QUIT=0;!F_QUIT;) {
		// Pause
		SDL_Delay(100);
		// event dispatcher
		while (SDL_PollEvent(&event)) {
			switch (event.type) {
				case SDL_QUIT:
					F_QUIT=1;
			}
		}
	}
	// Quit SDL
	SDL_FreeSurface(icon);
	SDL_FreeSurface(bg);
	for (char i=0;i<FIGsz;i++) SDL_FreeSurface(FIG[i]);
	SDL_Quit();
	// fake return
	fclose(log);
	return 0;
}
