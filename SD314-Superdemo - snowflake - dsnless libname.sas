/* Get the DSN-less connection information                */
/*    go through the ODBC Admin process to create the DSN */
/*    then dump the info into the SAS log. Use this to    */
/*    create a DSN-less LIBNAME statement.                */

libname snow odbc prompt=yes;
%put %superq(sysdbmsg);

/* These do not work... */
/* Plugging the info into the COMPLETE= option DOES NOT WORK... */
/* because of case issues with SCHEMA= value...                 */
/* Model work on the working versions including all the options */

libname snow odbc complete="driver={SnowflakeDSIIDriver};SERVER=saspartner.snowflakecomputing.com;
                            WAREHOUSE=loader_wh;database=jeffdb;schema='SGFDEMO';UID=jbailey;PWD=passwd123;TRACING=4";
libname snow odbc complete="driver={SnowflakeDSIIDriver};SERVER=saspartner.snowflakecomputing.com;
                            WAREHOUSE=loader_wh;database=jeffdb;schema=SGFDEMO;UID=jbailey;PWD=passwd123;TRACING=4";
libname snow odbc complete="driver={SnowflakeDSIIDriver};SERVER=saspartner.snowflakecomputing.com;
                            WAREHOUSE=loader_wh;database=jeffdb;UID=jbailey;PWD=passwd123;TRACING=4" schema=sgfdemo;

/* These work... */
/* notice where I moved SCHEMA= option */
libname snow odbc complete="driver={SnowflakeDSIIDriver};SERVER=saspartner.snowflakecomputing.com;
                            WAREHOUSE=loader_wh;database=jeffdb;UID=jbailey;PWD=passwd123;TRACING=4" schema='SGFDEMO' 
                            dbcommit=32000 autocommit=no 
                            readbuff=32000 insertbuff=32000;
libname snow odbc complete="driver={SnowflakeDSIIDriver};SERVER=saspartner.snowflakecomputing.com;
                            WAREHOUSE=loader_wh;database=jeffdb;UID=jbailey;PWD=passwd123;TRACING=4" schema=SGFDEMO 
                            dbcommit=32000 autocommit=no 
                            readbuff=32000 insertbuff=32000;;

