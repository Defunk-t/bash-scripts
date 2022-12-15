#!/bin/sh

# Pipe into and out of user's editor preference
TMPFILE=`mktemp /tmp/pw.XXXXXXXX`
cat > ${TMPFILE}
${EDITOR} ${TMPFILE} < /dev/tty > /dev/tty
cat ${TMPFILE}
rm ${TMPFILE}
