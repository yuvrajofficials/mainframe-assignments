//JCLASS2  JOB MSGLEVEL=(1,1),NOTIFY=&SYSUID
//*---------------------------------------------
//* STEP - 1: COMPILING JCLASS2 COBOL PROGRAM
//*---------------------------------------------
//COBRUN  EXEC IGYWCL
//COBOL.SYSIN  DD DSN=Z66845.COBOL(JCLASS2),DISP=SHR
//LKED.SYSLMOD DD DSN=Z66845.LOAD(JCLASS2),DISP=SHR
//*---------------------------------------------
//* STEP - 2: RUN JCLASS2 COBOL PROGRAM
//*---------------------------------------------
//RUN     EXEC PGM=JCLASS2
//STEPLIB  DD DSN=Z66845.LOAD,DISP=SHR
//DD1      DD DSN=Z66845.INPUT.FILE1,DISP=SHR
//DD2      DD DSN=Z66845.INPUT.FILE2,DISP=SHR
//DD3      DD DSN=Z66845.OUTPUT(FILE3),DISP=OLD
//SYSOUT   DD SYSOUT=*
//CEEDUMP   DD DUMMY
//SYSUDUMP  DD DUMMY
