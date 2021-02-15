#include "host.h"

#include "osd.h"
#include "keyboard.h"
#include "menu.h"
#include "ps2.h"
#include "minfat.h"
#include "spi.h"
#include "fileselector.h"

fileTYPE file;


int OSD_Puts(char *str)
{
	int c;
	while((c=*str++))
		OSD_Putchar(c);
	return(1);
}

/*
void TriggerEffect(int row)
{
	int i,v;
	Menu_Hide();
	for(v=0;v<=16;++v)
	{
		for(i=0;i<4;++i)
			PS2Wait();

		HW_HOST(REG_HOST_SCALERED)=v;
		HW_HOST(REG_HOST_SCALEGREEN)=v;
		HW_HOST(REG_HOST_SCALEBLUE)=v;
	}
	Menu_Show();
}
*/
void Delay()
{
	int c=16384; // delay some cycles
	while(c)
	{
		c--;
	}
}
void SuperDelay()
{	int i=1;
	for (i=1;i<=576;i++)
	{
		Delay();
	}
}

void Reset(int row)
{
	HW_HOST(REG_HOST_CONTROL)=HOST_CONTROL_RESET|HOST_CONTROL_DIVERT_KEYBOARD; // Reset host core
	Delay();
	HW_HOST(REG_HOST_CONTROL)=HOST_CONTROL_DIVERT_KEYBOARD;
	Menu_Hide();
}

void ResetCrt(int row)
{
	HW_HOST(REG_HOST_CONTROL)=HOST_CONTROL_RSTCRT|HOST_CONTROL_DIVERT_KEYBOARD; // Reset host core
	Delay();
	HW_HOST(REG_HOST_CONTROL)=HOST_CONTROL_DIVERT_KEYBOARD;
	Menu_Hide();
}

void Play(int row)
{
	HW_HOST(REG_HOST_CONTROL)=HOST_CONTROL_PLAY|HOST_CONTROL_DIVERT_KEYBOARD;
	Delay();
	HW_HOST(REG_HOST_CONTROL)=HOST_CONTROL_DIVERT_KEYBOARD;
	Menu_Hide();
}

void UnloadTap(int row)
{
	HW_HOST(REG_HOST_CONTROL)=HOST_CONTROL_UNLOADTAP|HOST_CONTROL_DIVERT_KEYBOARD;
	Delay();
	HW_HOST(REG_HOST_CONTROL)=HOST_CONTROL_DIVERT_KEYBOARD;
	Menu_Hide();
}

void Video(int row)
{
	
	HW_HOST(REG_HOST_CONTROL)=HOST_CONTROL_VIDEO|HOST_CONTROL_DIVERT_KEYBOARD; // Send start
	Delay();
	HW_HOST(REG_HOST_CONTROL)=HOST_CONTROL_DIVERT_KEYBOARD;
}

static struct menu_entry topmenu[]; // Forward declaration.
/*
// RGB scaling submenu
static struct menu_entry rgbmenu[]=
{
	{MENU_ENTRY_SLIDER,"Red",MENU_ACTION(16)},
	{MENU_ENTRY_SLIDER,"Green",MENU_ACTION(16)},
	{MENU_ENTRY_SLIDER,"Blue",MENU_ACTION(16)},
	{MENU_ENTRY_SUBMENU,"Exit",MENU_ACTION(topmenu)},
	{MENU_ENTRY_NULL,0,0}
};


// Test pattern names
static char *testpattern_labels[]=
{
	"Test pattern 1",
	"Test pattern 2",
	"Test pattern 3",
	"Test pattern 4"
};
*/

static char *st_scanlines[]=
{
	"Scandoubler Ninguno",
	"Scandoubler HQ2x-320",
	"Scandoubler HQ2x-160",
	"Scandoubler CRT 25%",
	"Scandoubler CRT 50%",
	"Scandoubler CRT 75%"
};

static char *st_video[]=
{
	"Video PAL",
	"Video NTSC"
};

static char *st_videofrm[]=
{
	"Aspecto Original",
	"Aspecto Ancho"
};

static char *st_videoar[]=
{
	"Formato Original",
	"Formato Pantalla Completa",
	"Formato [ARC1]",
	"Formato [ARC2]"
};

static char *st_paleta[]=
{
	"Paleta C64",
	"Paleta CePeCeRa"
};

static char *st_sid_l[]=
{
	"SID Izquierdo 6581",
	"SID Izquierdo 8580"
};

static char *st_sid_r[]=
{
	"SID Derecho 6581",
	"SID Derecho 8580"
};

static char *st_sid_addr[]=
{
	"SID Derecho Addr Igual",
	"SID Derecho Addr DE00",
	"SID Derecho Addr D420",
	"SID Derecho Addr D500",
	"SID Derecho Addr DF00"
};

static char *st_sndexp[]=
{
	"Expansion de Sonido No",
	"Expansion de Sonido OPL2"
};

static char *st_stereomix[]=
{
	"Mezcla Stereo No",
	"Mezcla Stereo 25%",
	"Mezcla Stereo 50%",
	"Mezcla Stereo 100%"
};

static char *st_dm[]=
{
	"Digimax No",
	"Digimax Si"
};

static char *st_sid_dm[]=
{
	"Sid digital a Digimax No",
	"Sid digital a Digimax Si"
};

static char *st_joys[]=
{
	"Joysticks Normal",
	"Joysticks Intercambiados"
};

static char *st_tapsnd[]=
{
	"Sonido Cinta Off",
	"Sonido Cinta On"
};

static char *st_fdwr[]=
{
	"Disco Grabable",
	"Disco Solo Lectura"
};

static char *st_port[]=
{
	"Puerto UART",
	"Puerto Joysticks"
};

static char *st_pot1[]=
{
	"Pot 1&2 Joy 1 Disparo 2/3",
	"Pot 1&2 Raton",
	"Pot 1&2 Paddles 1&2"
};

static char *st_pot2[]=
{
	"Pot 3&4 Joy 2 Disparo 2/3",
	"Pot 3&4 Raton",
	"Pot 3&4 Paddles 3&4"
};

static char *st_kernel[]=
{
	"Kernel Cargable",
	"Kernel C64",
	"Kernel C64GS",
	"Kernel Japones"
};

// Video submenu
static struct menu_entry vidmenu[]=
{
	{MENU_ENTRY_CYCLE,(char *)st_video,MENU_ACTION(2)},	
	{MENU_ENTRY_CYCLE,(char *)st_videofrm,MENU_ACTION(2)},	
	{MENU_ENTRY_CYCLE,(char *)st_videoar,MENU_ACTION(4)},	
	{MENU_ENTRY_CYCLE,(char *)st_scanlines,MENU_ACTION(6)},	
	{MENU_ENTRY_CYCLE,(char *)st_paleta,MENU_ACTION(2)},
	{MENU_ENTRY_SUBMENU,"Exit",MENU_ACTION(topmenu)},
	{MENU_ENTRY_NULL,0,0}
};

static struct menu_entry audmenu[]=
{
	{MENU_ENTRY_CYCLE,(char *)st_sid_l,MENU_ACTION(2)},	
	{MENU_ENTRY_CYCLE,(char *)st_sid_r,MENU_ACTION(2)},	
	{MENU_ENTRY_CYCLE,(char *)st_sid_addr,MENU_ACTION(5)},
	{MENU_ENTRY_CYCLE,(char *)st_sndexp,MENU_ACTION(2)},
	{MENU_ENTRY_CYCLE,(char *)st_stereomix,MENU_ACTION(4)},
	{MENU_ENTRY_CYCLE,(char *)st_dm,MENU_ACTION(2)},
	{MENU_ENTRY_CYCLE,(char *)st_sid_dm,MENU_ACTION(2)},
	{MENU_ENTRY_SUBMENU,"Exit",MENU_ACTION(topmenu)},
	{MENU_ENTRY_NULL,0,0}
};

static struct menu_entry prtmenu[]=
{
	{MENU_ENTRY_CYCLE,(char *)st_joys,MENU_ACTION(2)},	
	{MENU_ENTRY_CYCLE,(char *)st_port,MENU_ACTION(2)},	
	{MENU_ENTRY_CYCLE,(char *)st_pot1,MENU_ACTION(3)},
	{MENU_ENTRY_CYCLE,(char *)st_pot2,MENU_ACTION(3)},
	{MENU_ENTRY_SUBMENU,"Exit",MENU_ACTION(topmenu)},
	{MENU_ENTRY_NULL,0,0}
};


// Our toplevel menu
static struct menu_entry topmenu[]=
{
//      NUMERO MAXIMO DE LINEAS EN MENU SON 16 (PARA MAS HACER SUBMENUS)
	{MENU_ENTRY_CALLBACK,"   = COMODORE  64 =   ",0},
	{MENU_ENTRY_CALLBACK,"      NeuroRulez      ",0},
	{MENU_ENTRY_CALLBACK,"                      ",0},
	{MENU_ENTRY_CALLBACK,"Reset",MENU_ACTION(&Reset)},	
	{MENU_ENTRY_CALLBACK,"Reset & Soltar Cartucho",MENU_ACTION(&ResetCrt)},
	{MENU_ENTRY_SUBMENU,"Video \x10",MENU_ACTION(vidmenu)},
	{MENU_ENTRY_SUBMENU,"Audio \x10",MENU_ACTION(audmenu)},
	{MENU_ENTRY_SUBMENU,"Puertos \x10",MENU_ACTION(prtmenu)},
	{MENU_ENTRY_CYCLE,(char *)st_kernel,MENU_ACTION(4)},
	{MENU_ENTRY_CYCLE,(char *)st_tapsnd,MENU_ACTION(2)},
	{MENU_ENTRY_CYCLE,(char *)st_fdwr,MENU_ACTION(2)},
	{MENU_ENTRY_CALLBACK,"Sacar Cinta",MENU_ACTION(&UnloadTap)},
	{MENU_ENTRY_CALLBACK,"Play/Stop Cinta",MENU_ACTION(&Play)},
	{MENU_ENTRY_CALLBACK,"Cargar Disco/Cinta/Cart \x10",MENU_ACTION(&FileSelector_Show)},
	{MENU_ENTRY_CALLBACK,"Exit",MENU_ACTION(&Menu_Hide)},
	{MENU_ENTRY_NULL,0,0}
};


// An error message
static struct menu_entry loadfailed[]=
{
	{MENU_ENTRY_SUBMENU,"Carga Fallida",MENU_ACTION(loadfailed)},
	{MENU_ENTRY_SUBMENU,"OK",MENU_ACTION(&topmenu)},
	{MENU_ENTRY_NULL,0,0}
};


static int LoadMED(const char *filename)
{
	int result=0;
	int opened;

	if((opened=FileOpen(&file,filename)))
	{
		int filesize=file.size;
		unsigned int c=0;
		int bits;

		HW_HOST(REG_HOST_ROMSIZE) = file.size;
		HW_HOST(REG_HOST_ROMEXT) = ((char)filename[10])+((char)filename[9]<<8)+((char)filename[8]<<16); //Pasa 24 Bits las 3 letras de la Extension en el registro de 31 bits (la primera en los bits 23:16 la segunda  en 15:7 y la tercera en 7:0	
		HW_HOST(REG_HOST_CONTROL)=HOST_CONTROL_LOADMED|HOST_CONTROL_DIVERT_SDCARD;

		bits=0;
		c=filesize-1;
		while(c)
		{
			++bits;
			c>>=1;
		}
		bits-=9;

		result=1;

		while(filesize>0)
		{
			OSD_ProgressBar(c,bits);
			if(FileRead(&file,sector_buffer))
			{
				int i;
				int *p=(int *)&sector_buffer;
				for(i=0;i<512;i+=4)
				{
					unsigned int t=*p++;
					unsigned char t1=t;
					unsigned char t2=t>>8;
					unsigned char t3=t>>16;
					unsigned char t4=t>>24;
					HW_HOST(REG_HOST_BOOTDATA)=t4;
					HW_HOST(REG_HOST_BOOTDATA)=t3;
					HW_HOST(REG_HOST_BOOTDATA)=t2;
					HW_HOST(REG_HOST_BOOTDATA)=t1;
				}
			}
			else
			{
				result=0;
				filesize=512;
			}
			FileNextSector(&file);
			filesize-=512;
			++c;
		}
	}

	SuperDelay();
	HW_HOST(REG_HOST_CONTROL)=HOST_CONTROL_DIVERT_SDCARD;

	if(result)
		{
		Menu_Set(topmenu);
		Menu_Hide();
		}
	else
		Menu_Set(loadfailed);

	return(result);
}


static int LoadROM(const char *filename)
{
	int result=0;
	int opened;

	HW_HOST(REG_HOST_CONTROL)=HOST_CONTROL_LOADROM | HOST_CONTROL_DIVERT_SDCARD;

	if((opened=FileOpen(&file,filename)))
	{
		int filesize=file.size;
		unsigned int c=0;
		int bits;

		bits=0;
		c=filesize-1;
		while(c)
		{
			++bits;
			c>>=1;
		}
		bits-=9;

		result=1;

		while(filesize>0)
		{
			OSD_ProgressBar(c,bits);
			if(FileRead(&file,sector_buffer))
			{
				int i;
				int *p=(int *)&sector_buffer;
				for(i=0;i<512;i+=4)
				{
					unsigned int t=*p++;
					unsigned char t1=t;
					unsigned char t2=t>>8;
					unsigned char t3=t>>16;
					unsigned char t4=t>>24;
					HW_HOST(REG_HOST_BOOTDATA)=t4;
					HW_HOST(REG_HOST_BOOTDATA)=t3;
					HW_HOST(REG_HOST_BOOTDATA)=t2;
					HW_HOST(REG_HOST_BOOTDATA)=t1;
				}
			}
			else
			{
				result=0;
				filesize=512;
			}
			FileNextSector(&file);
			filesize-=512;
			++c;
		}
	}
	HW_HOST(REG_HOST_ROMSIZE) = file.size;
	SuperDelay();
	HW_HOST(REG_HOST_CONTROL)=HOST_CONTROL_DIVERT_SDCARD;
	return(result);
}


int main(int argc,char **argv)
{
	int i;
	int dipsw=0;

	// Put the host core in reset while we initialise...
	//HW_HOST(REG_HOST_CONTROL)=HOST_CONTROL_RESET;

	HW_HOST(REG_HOST_CONTROL)=HOST_CONTROL_DIVERT_SDCARD;

	PS2Init();
	EnableInterrupts();

	OSD_Clear();
//	for(i=0;i<4;++i)
//	{
//		PS2Wait();	// Wait for an interrupt - most likely VBlank, but could be PS/2 keyboard
//		OSD_Show(1);	// Call this over a few frames to let the OSD figure out where to place the window.
//	}
//	OSD_Puts("Initializing SD card\n");

	if(!FindDrive())
		return(0);

	//OSD_Puts("Loading initial ROM...\n");
	//LoadROM("C64     DAT");
	FileSelector_SetLoadFunction(LoadMED);
	Menu_Set(topmenu);
	Menu_Hide();//oculta el menu por defecto al cargar el core.
	//Menu_Show(); //muestra el menu por defecto al cargar el core.

	while(1)
	{
		struct menu_entry *m;
		int visible;
		HandlePS2RawCodes();
		visible=Menu_Run();
		dipsw = 0;
		//Posicion del menu desde 0, 0x? bits max, << ? Posicion DIP
		//EJ: dipsw |= (MENU_CYCLE_VALUE(&topmenu[4])  & 0x7) << 3; 
		// Posicion 5 del topmenu, usa 3 bits, posicion dip [5:3]
		dipsw |= (MENU_CYCLE_VALUE(&vidmenu[0])  & 0x1) << 2;  //2 
		dipsw |= (MENU_CYCLE_VALUE(&vidmenu[1])  & 0x1) << 24; //24 
		dipsw |= (MENU_CYCLE_VALUE(&vidmenu[2])  & 0x3) << 4;  //5:4 	
		dipsw |= (MENU_CYCLE_VALUE(&vidmenu[3])  & 0x7) << 8;  //10:8 
		dipsw |= (MENU_CYCLE_VALUE(&vidmenu[4])  & 0x1) << 6;  //6

		dipsw |= (MENU_CYCLE_VALUE(&audmenu[0])  & 0x1) << 13; //13 
		dipsw |= (MENU_CYCLE_VALUE(&audmenu[1])  & 0x1) << 16; //16 
		dipsw |= (MENU_CYCLE_VALUE(&audmenu[2])  & 0x7) << 20; //22:20 
		dipsw |= (MENU_CYCLE_VALUE(&audmenu[3])  & 0x1) << 12; //12 
		dipsw |= (MENU_CYCLE_VALUE(&audmenu[4])  & 0x3) << 18; //19:18 
		dipsw |= (MENU_CYCLE_VALUE(&audmenu[5])  & 0x1) << 30; //
		dipsw |= (MENU_CYCLE_VALUE(&audmenu[6])  & 0x1) << 31; //

		dipsw |= (MENU_CYCLE_VALUE(&prtmenu[0])  & 0x1) << 3;  //3
		dipsw |= (MENU_CYCLE_VALUE(&prtmenu[1])  & 0x1) << 1;  //1
		dipsw |= (MENU_CYCLE_VALUE(&prtmenu[2])  & 0x3) << 26; //27:26
		dipsw |= (MENU_CYCLE_VALUE(&prtmenu[3])  & 0x3) << 28; //29:28

		dipsw |= (MENU_CYCLE_VALUE(&topmenu[8])  & 0x3) << 14; //15:14
		dipsw |= (MENU_CYCLE_VALUE(&topmenu[9])  & 0x1) << 11; //11
		dipsw |= (MENU_CYCLE_VALUE(&topmenu[10]) & 0x1) << 32; //11
		HW_HOST(REG_HOST_SW)=dipsw;	// Send the new values to the hardware.
		// If the menu's visible, prevent keystrokes reaching the host core.
		HW_HOST(REG_HOST_CONTROL)=(visible ?
									HOST_CONTROL_DIVERT_KEYBOARD|HOST_CONTROL_DIVERT_SDCARD :
									HOST_CONTROL_DIVERT_SDCARD); // Maintain control of the SD card so the file selector can work.
																 // If the host needs SD card access then we would release the SD
																 // card here, and not attempt to load any further files.
	}
	return(0);
}
