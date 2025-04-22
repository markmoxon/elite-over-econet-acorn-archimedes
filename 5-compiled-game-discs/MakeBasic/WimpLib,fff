REM >WimpLib - Wimp Library
:
DEF FNwimperror(block%,errno%,err$,task$,ok%,cancel%)
LOCAL flag%,response%
!block%=errno%
$(block%+4)=err$+CHR$(0)
flag%=ok%+(cancel%<<1)
SYS "Wimp_ReportError",block%,flag%,task$ TO ,response%
=response%
:
DEF FNpoll_flags(null%,redraw%,leave%,enter%,click%,key%,lose%,gain%,user%,userrec%,userack%)
LOCAL flag%
flag%=null%+(redraw%<<1)+(leave%<<4)+(enter%<<5)+(click%<<6)+(key%<<8)+(lose%<<11)+(gain%<<12)+(user%<<17)+(userrec%<<18)+(userack%<<19)
=flag%
:
DEF FNst_create_window(block%,x%,y%,w%,h%,ww%,wh%,sx%,sy%,title$,ind%)
LOCAL iflag%,i2%,i3%,tflag%,wflag%
IF ind%=0 THEN iflag%=0:i2%=0:i3%=0 ELSE iflag%=1:i2%=-1:i3%=LEN(title$)
tflag%=FNtitle_flags(1,0,1,1,0,iflag%,0,0,0)
wflag%=FNwindow_flags(1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0)
=FNcreate_window(block%,x%,y%,w%,h%,ww%,wh%,sx%,sy%,title$,12,wflag%,0,0,-1,tflag%,7,2,7,0,3,1,0,ind%,i2%,i3%,1)
:
DEF FNst_create_window2(block%,x%,y%,w%,h%,ww%,wh%,sx%,sy%,title$,ind%,input%,wflag%)
LOCAL iflag%,i2%,i3%,selcol%,tflag%
IF ind%=0 THEN iflag%=0:i2%=0:i3%=0 ELSE iflag%=1:i2%=-1:i3%=LEN(title$)
IF input%=0 THEN selcol%=2 ELSE selcol%=12
tflag%=FNtitle_flags(1,0,1,1,0,iflag%,0,0,0)
=FNcreate_window(block%,x%,y%,w%,h%,ww%,wh%,sx%,sy%,title$,selcol%,wflag%,0,0,-1,tflag%,7,2,7,0,3,1,0,ind%,i2%,i3%,1)
:
DEF FNcreate_window(block%,x%,y%,w%,h%,ww%,wh%,sx%,sy%,title$,input%,wflag%,mw%,mh%,behind%,tflag%,tfore%,tback%,wfore%,wback%,sout%,sin%,button%,icon1%,icon2%,icon3%,sparea%)
LOCAL handle%,ist%
!block%=x%:block%!4=y%-h%
block%!8=x%+w%:block%!12=y%
block%!16=sx%:block%!20=-sy%
block%!24=behind%:block%!28=wflag%
block%?32=tfore%:block%?33=tback%
block%?34=wfore%:block%?35=wback%
block%?36=sout%:block%?37=sin%
block%?38=input%:block%?39=0
block%!40=0:block%!44=-wh%
block%!48=ww%:block%!52=0
block%!56=tflag%:block%!60=button%<<12
block%!64=sparea%
block%?68=mw%MOD256:block%?69=mw%DIV256
block%?70=mh%MOD256:block%?71=mh%DIV256
ist%=((tflag%>>6)AND4)+(tflag%AND3)
CASE ist% OF
 WHEN 1,2,3:$(block%+72)=title$
 WHEN 5,6,7:block%!72=icon1%:block%!76=icon2%:block%!80=icon3%:$icon1%=title$
ENDCASE
block%!84=0
SYS "Wimp_CreateWindow",,block% TO handle%
=handle%
:
DEF FNtitle_flags(text%,sp%,chor%,cver%,anti%,ind%,rjust%,half%,font%)
LOCAL flag%
flag%=text%+(sp%<<1)+(chor%<<3)+(cver%<<4)+(anti%<<6)+(ind%<<8)+(rjust%<<9)+(half%<<11)
IF anti%<>0 THEN flag%+=(font%<<24)
=flag%
:
DEF FNwindow_flags(back%,close%,title%,toggle%,vscr%,hscr%,adj%,move%,wredraw%,pane%,bound%,scr%,rscr%,gcol%,below%,hotkey%)
LOCAL flag%
flag%=(move%<<1)+(wredraw%<<4)+(pane%<<5)+(bound%<<6)+(scr%<<8)+(rscr%<<9)+(gcol%<<10)+(below%<<11)+(hotkey%<<12)+(back%<<24)+(close%<<25)+(title%<<26)+(toggle%<<27)+(vscr%<<28)+(adj%<<29)+(hscr%<<30)+(1<<31)
=flag%
:
DEF FNcreate_icon(block%,whandle%,x%,y%,w%,h%,flag%,text$,icon1%,icon2%,icon3%)
LOCAL handle%,ist%
!block%=whandle%:block%!4=x%
block%!8=-y%-h%:block%!12=x%+w%
block%!16=-y%:block%!20=flag%
ist%=((flag%>>6)AND4)+(flag%AND3)
CASE ist% OF
 WHEN 1,2,3:$(block%+24)=text$
 WHEN 5,6,7:block%!24=icon1%:block%!28=icon2%:block%!32=icon3%:$icon1%=text$
ENDCASE
SYS "Wimp_CreateIcon",,block% TO handle%
=handle%
:
DEF FNicon_flags(text%,sp%,bor%,chor%,cver%,fill%,anti%,redraw%,ind%,rjust%,adj%,half%,button%,esg%,invert%,shade%,del%,fcol%,bcol%,font%)
LOCAL flag%
flag%=text%+(sp%<<1)+(bor%<<2)+(chor%<<3)+(cver%<<4)+(fill%<<5)+(anti%<<6)+(redraw%<<7)+(ind%<<8)+(rjust%<<9)+(adj%<<10)+(half%<<11)+(button%<<12)+(esg%<<16)+(invert%<<21)+(shade%<<22)+(del%<<23)
IF anti%=0 THEN
 flag%+=(fcol%<<24)+(bcol%<<28)
ELSE
 flag%+=(font%<<24)
ENDIF
=flag%
:
DEF FNload_sprites(file$)
LOCAL file%,size%,sprite%
file%=OPENIN file$
size%=EXT#file%+16:CLOSE#file%
DIM sprite% size%
!sprite%=size%:sprite%!8=16
SYS "OS_SpriteOp",&109,sprite%
SYS "OS_SpriteOp",&10A,sprite%,file$
=sprite%
:
DEF FNicon_bar_icon(block%,spname$,side%)
LOCAL flag%
flag%=FNicon_flags(0,1,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0)
=FNcreate_icon(block%,side%,0,-68,68,68,flag%,spname$,0,0,0)
:
DEF FNchangeable_bar_icon(block%,spname$,side%,spname%,sprite%)
LOCAL flag%
flag%=FNicon_flags(0,1,0,0,0,0,0,0,1,0,0,0,3,0,0,0,0,0,0,0)
=FNcreate_icon(block%,side%,0,-68,68,68,flag%,spname$,spname%,sprite%,LEN($spname%)+1)
:
DEF PROCchange_icon(block%,whandle%,ihandle%,new$)
!block%=whandle%:block%!4=ihandle%
SYS "Wimp_GetIconState",,block%
$(block%!28)=new$
!block%=whandle%:block%!4=ihandle%
block%!8=0:block%!12=0
SYS "Wimp_SetIconState",,block%
ENDPROC
:
DEF PROCinit_menu(menu%,RETURN width%,RETURN end%,title$)
width%=LEN(title$)
$menu%=title$:menu%?12=7
menu%?13=2:menu%?14=7:menu%?15=0
menu%!16=(width%+1)*16:menu%!20=44
menu%!24=0:end%=menu%+28
ENDPROC
:
DEF PROCst_menu_item(menu%,RETURN width%,RETURN end%,text$,tick%,dot%,shade%,last%,link%)
LOCAL f%
f%=FNst_menu_flags(shade%)
PROCmenu_item(menu%,width%,end%,text$,tick%,dot%,shade%,last%,link%,write%,mess%,f%,0,0,0)
ENDPROC
:
DEF PROCmenu_item(menu%,RETURN width%,RETURN end%,text$,tick%,dot%,shade%,last%,link%,write%,mess%,flag%,icon1%,icon2%,icon3%)
LOCAL f%,ist%
f%=tick%+(dot%<<1)+(write%<<2)+(mess%<<3)+(last%<<7)
!end%=f%:end%!4=link%:end%!8=flag%
ist%=((flag%>>6)AND4)+(flag%AND3)
CASE ist% OF
 WHEN 1,2,3:$(end%+12)=text$
 WHEN 5,6,7:end%!12=icon1%:end%!16=icon2%:end%!20=icon3%
ENDCASE
end%+=24
IF LEN(text$)>width% THEN width%=LEN(text$)
menu%!16=(width%+1)*16
ENDPROC
:
DEF FNmenu_flags(text%,sp%,bor%,chor%,anti%,ind%,rjust%,half%,shade%,fcol%,bcol%,font%)
LOCAL flag%
flag%=text%+(sp%<<1)+(bor%<<2)+(chor%<<3)+(1<<5)+(anti%<<6)+(ind%<<8)+(rjust%<<9)+(half%<<11)+(shade%<<22)
IF anti%=0 THEN
 flag%+=(fcol%<<24)+(bcol%<<28)
ELSE
 flag%+=(font%<<24)
ENDIF
=flag%
:
DEF FNst_menu_flags(shade%)
=FNmenu_flags(1,0,0,0,0,0,0,0,shade%,7,0,0)
:
DEF PROCdisplay_bar_menu(menu%,items%,dots%,x%)
SYS "Wimp_CreateMenu",,menu%,x%-64,96+(items%*44)+(dots%*24)
ENDPROC
:
DEF PROCdisplay_menu(menu%,x%,y%)
SYS "Wimp_CreateMenu",,menu%,x%-64,y%
ENDPROC
:
DEF PROCdisplay_submenu(menu%,x%,y%)
SYS "Wimp_CreateSubMenu",,menu%,x%,y%
ENDPROC
:
DEF FNfirst(menu$)
LOCAL ch$
IF INSTR(menu$,".")=0 THEN ch$=menu$ ELSE ch$=LEFT$(menu$,INSTR(menu$,".")-1)
=ch$
:
DEF FNrest(menu$)
LOCAL ch$
IF INSTR(menu$,".")=0 THEN ch$="" ELSE ch$=RIGHT$(menu$,LEN(menu$)-INSTR(menu$,"."))
=ch$
:
DEF FNleaf(file$)
LOCAL pos%,temp%
temp%=0
REPEAT
pos%=temp%+1
temp%=INSTR(file$,".",pos%)
UNTIL temp%=0
=MID$(file$,pos%)
:
DEF FNbranch(file$)
LOCAL pos%,br$,temp%
IF INSTR(file$,".")=0 THEN
 br$=""
ELSE
 temp%=0
 REPEAT
 pos%=temp%+1
 temp%=INSTR(file$,".",pos%)
 UNTIL temp%=0
 br$=LEFT$(file$,pos%-2)
ENDIF
=br$
:
DEF FNzero_string(point%)
LOCAL string$
string$=""
WHILE ?point%
 string$+=CHR$?point%
 point%+=1
ENDWHILE
=string$
:
DEF FNlibrary_version
=50
:
DEF PROCquicksave(block%,savebox%,iname%,task$)
LOCAL temp%,file$
!block%=savebox%:block%!4=iname%
SYS "Wimp_GetIconState",,block%
file$=$(block%!28)
IF INSTR(file$,".") THEN
 PROCsave(file$)
ELSE
 temp%=FNwimperror(block%,255,"To save, drag the icon to a directory viewer",task$,1,0)
ENDIF
ENDPROC
:
DEF PROCstart_dragsave(block%,savebox%,iicon%)
LOCAL ox%,oy%
!block%=savebox%
SYS "Wimp_GetWindowState",,block%
ox%=block%!4-block%!20
oy%=block%!16-block%!24
block%!4=iicon%
SYS "Wimp_GetIconState",,block%
!block%=savebox%:block%!4=5
block%!8=ox%+block%!8
block%!12=oy%+block%!12
block%!16=ox%+block%!16
block%!20=oy%+block%!20
block%!24=0:block%!28=0
block%!32=&7FFFFFFF
block%!36=&7FFFFFFF
SYS "Wimp_DragBox",,block%
ENDPROC
:
DEF PROCend_dragsave(block%,savebox%,iname%,filetype%,filesize%)
LOCAL file$
!block%=savebox%:block%!4=iname%
SYS "Wimp_GetIconState",,block%
file$=$(block%!28)
SYS "Wimp_GetPointerInfo",,block%
block%!20=block%!12
block%!24=block%!16
block%!28=block%!0
block%!32=block%!4
block%!36=filesize%
block%!0=64:block%!12=0
block%!16=1:block%!40=filetype%
$(block%+44)=FNleaf(file$)
SYS "Wimp_SendMessage",17,block%,block%!20,block%!24
ENDPROC
:
DEF FNmessage_datasave(block%)
LOCAL ok%,file$
file$=FNzero_string(block%+44)
PROCsave(file$)
IF block%!36>-1 THEN ok%=TRUE ELSE ok%=FALSE
block%!12=block%!8
!block%=256:block%!16=3
SYS "Wimp_SendMessage",18,block%,block%!20,block%!24
IF ok% THEN =file$ ELSE =""
:
DEF FNmessage_ramsave(block%,task%,RETURN srcbuff%,RETURN bytes%)
LOCAL btrans%,code%,dbuff%,dtask%,last%
dtask%=block%!4:dbuff%=block%!20
IF bytes%>=block%!24 THEN
 btrans%=block%!24
 code%=18:last%=FALSE
ELSE
 btrans%=bytes%
 code%=17:last%=TRUE
ENDIF
SYS "Wimp_TransferBlock",task%,srcbuff%,dtask%,dbuff%,btrans%
srcbuff%+=btrans%:bytes%-=btrans%
block%!12=block%!8:block%!16=7
block%!20=dbuff%:block%!24=btrans%
SYS "Wimp_SendMessage",code%,block%,dtask%
=last%
