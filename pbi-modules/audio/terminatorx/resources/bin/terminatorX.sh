#!/bin/sh

ps -auwx | grep "jackd" | grep -v grep >/dev/null 2>/dev/null
if [ "$?" != "0" ]
then
   # Start jack
   ( jackd -r -d oss ) &
   sleep 5
fi

# Start terminatorX now
terminatorX "$@"

killall -9 jackd
