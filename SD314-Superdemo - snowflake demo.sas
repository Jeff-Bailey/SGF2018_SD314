/* Play around with the option values */
libname snowfast odbc dsn='snowflake_DSN' schema=SGFDEMO  
                      user=jbailey pw=passwd123
                      dbcommit=0 autocommit=no 
                      readbuff=20000 insertbuff=20000;

libname snowslow odbc dsn='snowflake_DSN' schema=SGFDEMO  
                      user=jbailey pw=passwd123;


/* 5MB - */
data work.small_table_5MB;
   do i = 1 to 25000;
      text1="abcdefghijklmnopqrstuvwxyz0123456789";
	  text2="abcdefghijklmnopqrstuvwxyz0123456789";
      text3="abcdefghijklmnopqrstuvwxyz0123456789";
      text4="abcdefghijklmnopqrstuvwxyz0123456789";
	  text5="abcdefghijklmnopqrstuvwxyz0123456789";
	  text6="abcdefghijklmnopqrstuvwxyz0123456789";
      output;
	end;
run;

data snowfast.small_table_5MB_fast;
   set work.small_table_5MB;
run;

/* Do Not run this - it will take forever */

/*
data snowslow.small_table_5MB_slow;
   set work.small_table_5MB;
run;
*/

/* 54MB - */
data work.small_table_54MB;
   do i = 1 to 250000;
      text1="abcdefghijklmnopqrstuvwxyz0123456789";
	  text2="abcdefghijklmnopqrstuvwxyz0123456789";
      text3="abcdefghijklmnopqrstuvwxyz0123456789";
      text4="abcdefghijklmnopqrstuvwxyz0123456789";
	  text5="abcdefghijklmnopqrstuvwxyz0123456789";
	  text6="abcdefghijklmnopqrstuvwxyz0123456789";
      output;
	end;
run;

data snowfast.small_table_54MB_fast;
   set work.small_table_54MB;
run;

/* 540MB - */
data work.med_table_540MB;
   do i = 1 to 2500000;
      text1="abcdefghijklmnopqrstuvwxyz0123456789";
	  text2="abcdefghijklmnopqrstuvwxyz0123456789";
      text3="abcdefghijklmnopqrstuvwxyz0123456789";
      text4="abcdefghijklmnopqrstuvwxyz0123456789";
	  text5="abcdefghijklmnopqrstuvwxyz0123456789";
	  text6="abcdefghijklmnopqrstuvwxyz0123456789";
      output;
	end;
run;

data snowfast.med_table_540MB_fast;
   set work.med_table_540MB;
run;

/* READ Tests */
data work.small_table_5mb_slow;
   set snowslow.small_table_5mb_fast;
run;

data work.small_table_54mb_slow;
   set snowslow.small_table_54mb_fast;
run;

data work.small_table_540mb_slow;
   set snowslow.med_table_540mb_fast;
run;

data work.small_table_540mb_fast;
   set snowfast.med_table_540mb_fast;
run;

/* 5.4GB - */
data work.large_table_5GB;
   do i = 1 to 25000000;
      text1="abcdefghijklmnopqrstuvwxyz0123456789";
	  text2="abcdefghijklmnopqrstuvwxyz0123456789";
      text3="abcdefghijklmnopqrstuvwxyz0123456789";
      text4="abcdefghijklmnopqrstuvwxyz0123456789";
	  text5="abcdefghijklmnopqrstuvwxyz0123456789";
	  text6="abcdefghijklmnopqrstuvwxyz0123456789";
      output;
	end;
run;

data snowfast.large_table_5GB_fast;
   set work.large_table_5GB;
run;

/* READ Tests */
data work.large_table_5gb_slow;
   set snowslow.large_table_5gb_fast;
run;

data work.large_table_5gb_fast;
   set snowfast.large_table_5gb_fast;
run;


