REM !RunImage
REM Elite over Econet
REM By Mark Moxon
:
LIBRARY "<EliteNet$Dir>.WimpLib"
IF FNlibrary_version<50 THEN ERROR 255,"Out of date version of Wimp Library"
PROCinit
SYS "OS_ReadMonotonicTime" TO oldtime%
REPEAT
 SYS "Wimp_Poll",0,block% TO reason%
 CASE reason% OF
  WHEN 0
   SYS "OS_ReadMonotonicTime" TO newtime%
   IF newtime%>oldtime%+500 THEN oldtime%=newtime%:PROCupdate_scores
  WHEN 2:SYS "Wimp_OpenWindow",,block%
  WHEN 3:SYS "Wimp_CloseWindow",,block%
  WHEN 6:PROCmouse_click
  WHEN 7:PROCcreate_data:PROCend_dragsave(block%,save%,i_filename%,filetype%,filesize%)
  WHEN 8:PROCkey_pressed
  WHEN 9:PROCmenu_selection
  WHEN 17,18:PROCmessage
  WHEN 19:SYS "OS_File",6,block%+44:PROCerror("Data transfer failed: Receiver died")
 ENDCASE
UNTIL quit%
SYS "Wimp_CloseDown",task%,&4B534154
END
:
DEF PROCmessage
 CASE block%!16 OF
  WHEN 0:quit%=TRUE
  WHEN 2:temp$=FNmessage_datasave(block%)
  WHEN 3,5
   IF block%!40=filetype% THEN PROCload_ack:PROCload_file(FNzero_string(block%+44))
  WHEN 6
   IF firstsave% THEN
    PROCcreate_data
    source_buffer%=scorefile%:bytes_left%=filesize%
   ENDIF
   firstsave%=FNmessage_ramsave(block%,task%,source_buffer%,bytes_left%)
   IF firstsave% THEN SYS "Wimp_CreateMenu",,-1
 ENDCASE
ENDPROC
:
DEF PROCinit
 DIM block% &1000,tblock% &1000,eblock% &100,bmenu% &1000
 DIM ind% 500,ind2% 200,ind3% 400,tempname% 100,dc% &100,scorefile% 1000
 ON ERROR PROCerror("")
 task_name$="Elite over Econet"
 version$="1.20 (16-May-2025)"
 quit%=FALSE:tx_enabled%=0:nzcv%=0
 i_reset%=3:i_station%=6:i_port%=7
 i_interval%=8:i_enable%=12:i_kills%=16:i_deaths%=18
 i_version%=4:i_filename%=2:i_fileicon%=3
 filetype%=&3EE
 SYS "Wimp_Initialise",200,&4B534154,task_name$ TO wimp%,task%
 PROCtemplates
 PROCchange_icon(block%,info%,i_version%,version$)
 PROCupdate_icons
 flag%=FNicon_flags(0,1,0,0,0,0,0,0,0,0,0,0,3,0,0,0,0,0,0,0)
 icon_bar%=FNcreate_icon(block%,-1,0,-68,92,68,flag%,"!elitenet",0,0,0)
 PROCinit_menu(bmenu%,width%,end%,"EliteNet")
 PROCst_menu_item(bmenu%,width%,end%,"Info",0,0,0,0,info%)
 PROCst_menu_item(bmenu%,width%,end%,"Save",0,0,0,0,save%)
 PROCst_menu_item(bmenu%,width%,end%,"Quit",0,0,0,1,-1)
ENDPROC
:
DEF PROCerror(er$)
 LOCAL temp%
 IF er$="" THEN
  IF FNwimperror(eblock%,ERR,REPORT$+" (internal error code "+STR$(ERL)+")",task_name$,0,1)=2 THEN $eblock%="TASK":SYS "Wimp_CloseDown",task%,!eblock%:END
 ELSE
  temp%=FNwimperror(eblock%,255,er$,task_name$,1,0)
 ENDIF
ENDPROC
:
DEF PROCtemplates
 SYS "Wimp_OpenTemplate",,"<EliteNet$Dir>.Templates"
 $tempname%="main"
 SYS "Wimp_LoadTemplate",,block%,ind%,ind%+499,-1,tempname%,0
 SYS "Wimp_CreateWindow",,block% TO main%
 $tempname%="progInfo"
 SYS "Wimp_LoadTemplate",,block%,ind2%,ind2%+199,-1,tempname%,0
 SYS "Wimp_CreateWindow",,block% TO info%
 $tempname%="xfer_send"
 SYS "Wimp_LoadTemplate",,block%,ind3%,ind3%+399,-1,tempname%,0
 SYS "Wimp_CreateWindow",,block% TO save%
 SYS "Wimp_CloseTemplate"
ENDPROC
:
DEF PROCmouse_click
 CASE TRUE OF
  WHEN block%!12=-2 AND block%!8=2
   mx%=!block%
   menu_chosen%=bmenu%
   PROCdisplay_bar_menu(bmenu%,3,0,mx%)
  WHEN block%!12=-2 AND block%!8<>2
   !block%=main%
   SYS "Wimp_GetWindowState",,block%
   block%!28=-1
   SYS "Wimp_OpenWindow",,block%
  WHEN block%!12=main% AND block%!8<>2 AND block%!16=i_enable%
   PROCfetch_status
   IF tx_enabled%=0 THEN
    SYS "XElite_SetStatus",4 TO errblk%;nzcv%
   ELSE
    SYS "XElite_SetStatus",5 TO errblk%;nzcv%
   ENDIF
   IF nzcv% AND 1 THEN PROCerror(FNzero_string(errblk%+4))
   PROCupdate_icons
  WHEN block%!12=main% AND block%!8<>2 AND block%!16=i_reset%
   !eblock%=255
   $(eblock%+4)="Are you sure you want to reset the scores?"+CHR$(0)
   flag%=%10111
   SYS "Wimp_ReportError",eblock%,flag%,task_name$ TO ,response%
   IF response%=1 THEN
    SYS "XElite_SetStatus",3 TO errblk%;nzcv%
    IF nzcv% AND 1 THEN PROCerror(FNzero_string(errblk%+4)):ENDPROC
    PROCupdate_icons
   ENDIF
  WHEN block%!12=save% AND (block%!8 AND &50)>0 AND block%!16=i_fileicon%
   PROCstart_dragsave(block%,save%,i_fileicon%)
 ENDCASE
ENDPROC
:
DEF PROCmenu_selection
 SYS "Wimp_DecodeMenu",,menu_chosen%,block%,dc%
 SYS "Wimp_GetPointerInfo",,block%
 adjust%=block%!8 AND 1
 IF menu_chosen%=bmenu% AND $dc%="Quit" THEN quit%=TRUE
 IF adjust%=1 THEN PROCdisplay_bar_menu(bmenu%,3,0,mx%)
ENDPROC
:
DEF PROCkey_pressed
 IF !block%=main% THEN
  CASE block%!24 OF
   WHEN 13,&18E,&18A
    IF block%!4=i_interval% THEN i%=i_station% ELSE i%=block%!4+1
    PROCreturn_or_arrow_key
   WHEN &18F
    IF block%!4=i_station% THEN i%=i_interval% ELSE i%=block%!4-1
    PROCreturn_or_arrow_key
   OTHERWISE
    SYS "Wimp_ProcessKey",block%!24
   ENDCASE
 ELSE
  SYS "Wimp_ProcessKey",block%!24
 ENDIF
ENDPROC
:
DEF PROCreturn_or_arrow_key
 CASE block%!4 OF
  WHEN i_station%
   stn$=FNget_icon_string(i_station%)
   SYS "XElite_SetStatus",1,stn$ TO errblk%;nzcv%
   IF nzcv% AND 1 THEN PROCerror(FNzero_string(errblk%+4)) ELSE PROCsetCaret(i%)
  WHEN i_port%
   port%=FNget_icon_value(i_port%)
   SYS "XElite_SetStatus",2,port% TO errblk%;nzcv%
   IF nzcv% AND 1 THEN PROCerror(FNzero_string(errblk%+4)) ELSE PROCsetCaret(i%)
  WHEN i_interval%
   interval%=FNget_icon_value(i_interval%)
   SYS "XElite_SetStatus",6,interval% TO errblk%;nzcv%
   IF nzcv% AND 1 THEN PROCerror(FNzero_string(errblk%+4)) ELSE PROCsetCaret(i%)
 ENDCASE
ENDPROC
:
DEF PROCsetCaret(ic%)
 PROCupdate_icons
 !block%=main%
 block%!4=ic%
 SYS "Wimp_GetIconState",,block%
 SYS "Wimp_SetCaretPosition",main%,ic%,,,-1,LEN($(block%!28))
ENDPROC
:
DEF PROCfetch_status
 SYS "XElite_GetStatus" TO port%,station%,network%,kills%,deaths%,tx_enabled%,interval%;nzcv%
ENDPROC
:
DEF PROCupdate_icons
 PROCfetch_status
 IF nzcv% AND 1 THEN PROCerror(FNzero_string(port%+4)) ELSE PROCset_icons
ENDPROC
:
DEF PROCset_icons
 IF port%>0 THEN PROCchange_icon(block%,main%,i_port%,STR$(port%)) ELSE PROCchange_icon(block%,main%,i_port%,"")
 IF station%>0 OR network%>0 THEN PROCchange_icon(block%,main%,i_station%,FNstation_number(station%,network%)) ELSE PROCchange_icon(block%,main%,i_station%,"")
 PROCchange_icon(block%,main%,i_interval%,STR$(interval%))
 PROCchange_icon(block%,main%,i_kills%,STR$(kills%))
 PROCchange_icon(block%,main%,i_deaths%,STR$(deaths%))
 PROChideShowEnable
 PROChideShowReset
ENDPROC
:
DEF FNstation_number(station%,network%)
 zero$=""
 IF station%<100 THEN zero$="0"
 IF station%<10 THEN zero$="00"
=STR$(network%)+"."+zero$+STR$(station%)
:
DEF PROCupdate_scores
 PROCfetch_status
 old_kills%=FNget_icon_value(i_kills%)
 IF kills%<>old_kills% THEN PROCchange_icon(tblock%,main%,i_kills%,STR$(kills%))
 old_deaths%=FNget_icon_value(i_deaths%)
 IF deaths%<>old_deaths% THEN PROCchange_icon(tblock%,main%,i_deaths%,STR$(deaths%))
 PROChideShowReset
ENDPROC
:
DEF FNget_icon_string(icon%)
 !tblock%=main%
 tblock%!4=icon%
 SYS "Wimp_GetIconState",,tblock%
=$(tblock%!28)
:
DEF FNget_icon_value(icon%)
=VAL(FNget_icon_string(icon%))
:
DEF PROChideShowReset
 IF kills%=0 AND deaths%=0 THEN grey_out%=1 ELSE grey_out%=0
 !block%=main%
 block%!4=i_reset%
 block%!8=grey_out%<<22
 block%!12=1<<22
 SYS "Wimp_SetIconState",,block%
ENDPROC
:
DEF PROChideShowEnable
 IF port%=0 OR station%=0 THEN tx_enabled%=0:grey_out%=1 ELSE grey_out%=0
 !block%=main%
 block%!4=i_enable%
 block%!8=(tx_enabled%<<21)+(grey_out%<<22)
 block%!12=(1<<21)+(1<<22)
 SYS "Wimp_SetIconState",,block%
ENDPROC
:
DEF PROCsave(file$)
 SYS "OS_File",10,file$,filetype%,,scorefile%,scorefile%+filesize%
ENDPROC
:
DEF PROCcreate_data
 PROCupdate_scores
 scorefile%!0=FNget_icon_value(i_kills%)
 scorefile%!4=FNget_icon_value(i_deaths%)
 scorefile%!8=FNget_icon_value(i_port%)
 scorefile%!12=FNget_icon_value(i_interval%)
 stn$=FNget_icon_string(i_station%)
 $(scorefile%+16)=stn$
 filesize%=16+LEN(stn$)+1
ENDPROC
:
DEF PROCload_ack
 block%!12=block%!8
 block%!16=4
 SYS "Wimp_SendMessage",17,block%,block%!4
ENDPROC
:
DEF PROCload_file(file$)
 !tblock%=main%
 SYS "Wimp_GetWindowState",,tblock%
 tblock%!28=-1
 SYS "Wimp_OpenWindow",,tblock%
 LOCAL ERROR
 ON ERROR LOCAL PROCerror("Error reading Scoreboard file"):ENDPROC
 SYS "OS_File",255,file$,scorefile%,0
 kills%=scorefile%!0:SYS "XElite_SetStatus",7,kills%
 deaths%=scorefile%!4:SYS "XElite_SetStatus",8,deaths%
 port%=scorefile%!8:SYS "XElite_SetStatus",2,port%
 interval%=scorefile%!12:SYS "XElite_SetStatus",6,interval%
 stn$=$(scorefile%+16):SYS "XElite_SetStatus",1,stn$
 SYS "XElite_SetStatus",5
 PROCupdate_icons
ENDPROC
