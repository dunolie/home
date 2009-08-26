##!/bin/bash
# A SimpleWhoIs Script  
# http://script.m-redd.com
# Smaller than Life Projects
# By: MreDD
# projects - at - 0tue0 (dot) com
###################################
whoisip ()
{
echo ""
echo "------------------------------------"
echo "------------------------------------"
echo "--------Who Is Domain or IP---------"
echo " - - - - - Do Not Abuse - - - - - - "
echo "------------------------------------"
echo "------------------------------------"
echo ""
echo "  Ok Enter The IP" 
echo "  You Wanna WhoIs!! Ready?: (Press y/n)"
read IP

case $IP in
   y|yes)
echo "  Enter IP: "
  read IP ;;
   n|no)
echo ;;
  *)
echo "Sorry Problems?"
 exit 1 ;;
   esac
echo ""
echo " Who Is Information      "
echo "        for              "
echo "     $IP                 "
echo ""
whois $IP | grep -B25 "ARIN WHOIS database, last updated"
echo ""
echo "Done"

exit 0
}
################################################
################################################

##############################
##    WhoIs Domain          ##
##############################
whoisdomain ()
{
echo ""
echo "------------------------------------"
echo "------------------------------------"
echo "-------Who Is Domain----------------"
echo " - - - - - Do Not Abuse - - - - - - "
echo "------------------------------------"
echo "------------------------------------"
echo ""
echo "  Ok Enter The Domain" 
echo "  You Wanna WhoIs!! Ready?: (Press y/n)"
read DMAN

case $DMAN in
   y|yes)
echo "  Enter Domain Name: "
  read DMAN ;;
   n|no)
echo ;;
  *)
echo "Sorry Problems?"
 exit 1 ;;
   esac
echo ""
echo " Who Is Information      "
echo "        for              "
echo "     $DMAN               "
echo ""
whois $DMAN | grep -A11 "Domain Name:"
echo ""

exit 0
}
################################################
################################################

##############################
##    Reverse DNS LookUp    ##
##############################
reversedns ()
{
echo "------------------------------------"
echo "------------------------------------"
echo "--------Reverse DNS LookUp----------"
echo " - - - - - Do Not Abuse - - - - - - "
echo "------------------------------------"
echo "------------------------------------"
echo ""
echo "  Ok Enter The DNS for IP" 
echo "  You Wanna Lookup!! Ready?: (Press y/n)"
read IP

case $IP in
   y|yes)
echo "  Enter DNS or IP: "
  read IP ;;
   n|no)
echo ;;
  *)
echo "Sorry Problems?"
 exit 1 ;;
   esac
echo ""
echo " Reverse Dns Information "
echo "        for              "
echo "     $IP                 "
echo ""
host $IP | grep -A0 "has address"
echo ""
dig any $DMAN
echo ""
echo "Done"

exit 0
}
##########################################################
##########################################################

##################### END  FUNCTIONS #####################
echo "--------------------------------------------"
echo "--------------------------------------------"
echo "--       Simple WhoIs IP & Domain         --"
echo "--         Reverse DNS LookUp             --"
echo "--       Domain & IP WhoIs & LookUp       --"
echo "--             Do Not Abuse               --"
echo "--------------------------------------------"
echo "--------------------------------------------"

echo " 1) WhoIsIP 		A Simple WhoIs on an IP"
echo " 2) WhoIsDomain 	        A Simple WhoIs on a Domain"
echo " 3) ReverseDNSLookUp      A Simple Reverse DNS LookUp"

read CHOICE

  case "$CHOICE" in
   "1" ) whoisip ;;
   "2" ) whoisdomain ;;
   "3" ) reversedns ;;   
    *) 
 echo " Failure...."
 echo "   Try Later"
exit 1 ;;
  esac
exit 0
