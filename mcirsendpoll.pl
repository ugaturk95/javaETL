#!/usr/bin/perl -w

use strict;
use Time::localtime;
my($ct);
my($tm);
my ($seconds,$minutes,$hours);
my($loopcnt);

$loopcnt = 0;

system("java HL7MsgProcOutMCIR 0 send");
printf(STDOUT "Waiting for next MCIR send poll (%i)...\n", $loopcnt);# $client is the new connection   
$ct = ctime( );
printf(STDOUT "Started %s:mcirsendpoll::(%i) [%i]\n", $ct,$loopcnt,time());# $client is the new connection   

while (sleep(20)) {
    ++$loopcnt;
    #printf(STDOUT "Polling...\n");# $client is the new connection
    system("java HL7MsgProcOutMCIR 0 send");
    $ct = ctime( );
#    printf(STDOUT "%s:mcirssendpoll::(%i) [%i]\n", $ct,$loopcnt,time());# $client is the new connection   
    $tm = localtime();
    #($seconds,$minutes,$hours) = localtime(time());
    if (($loopcnt % 10) == 0) {
       printf(STDOUT "send:%02d:%02d:%02d::(%i) [%i]\n", $tm->hour,$tm->min,$tm->sec, $loopcnt,time());# $client is the new connection   
       }
}


EXIT:
