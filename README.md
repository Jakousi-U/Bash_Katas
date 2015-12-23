# Bash_Katas
Katas using Bash

1. **changeLog.sh** This program allows you to change the log level of the main
log used in cloudera (sqoop, hadoop).  ***Arguments*** <level> One of the
following:ALL, DEBUG, ERROR, FATAL, INFO, OFF, TRACE, TRACE_INT, WARN

2. **countRows.sh** This program retrieve the number of rows in a list of tables
using sqoop.  ***Arguments*** <filename> File with the list of tables (one per
line) <configFile> File to pass to sqoop using --options-file