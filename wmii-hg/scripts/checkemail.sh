#!/bin/sh
#
TUE=$(python $HOME/scripts/conky-scripts/mail/0tue0.py)
GMAIL=$(python $HOME/scripts/conky-scripts/mail/gmail.py)
PYRRHOUS=$(python $HOME/scripts/conky-scripts/mail/pyrrhous.py)
HOTMAIL=$(conkyEmail --template=$HOME/scripts/conky-scripts/mail/conkyhotmail.template)
INBOX=$(conkyEmail --template=$HOME/scripts/conky-scripts/mail/conkyinbox.template)
echo "Gmail: $GMAIL 0tue0: $TUE Pyrrhous: $PYRRHOUS $HOTMAIL $INBOX " > ~/.get_mail
