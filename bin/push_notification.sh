#!/bin/bash

# Telegram push notification script
# This script will send messages to your mobile devices
# using the Telegram service at Telegram.org.
# To use it, create a bot on Telegram.org
# and get an API key and chatID. You can pass them
# directly or set them as env variables. Then run
# the script with a message in quotes to send a
# push notification to your devices from the command line

while getopts "u:k:h" OPTION
do
        case $OPTION in
                u)
                        PU_USER=$OPTARG
                        ;;
                k)
                        PU_TOKEN=$OPTARG
                        ;;
                h)
                        echo "Telegram messenger"
                        echo -e "\tThis script sends push notifications to mobile devices using the Telegram service"
                        echo -e "\tYou must create an account at https://Telegram.org then create a bot for your messages."
                        echo -e "\tTelegram will accept a string, a URL, or a single line of input from stdin.\n"
                        echo -e "Usage: push_notification [OPTIONS] message \n"
                        echo -e "\tOptions:"
                        echo -e '\t\t-u,               Telegram Chat ID (Can be exported as $PU_USER).'
                        echo -e '\t\t-k,               Telegram Bot API token/key (Can be exported as PU_TOKEN).'
                        exit
                        ;;
        esac
done
shift "$((OPTIND - 1))"

PU_MESSAGE=$1

if [[ -z $PU_TOKEN ]]; then
        echo 'App key missing. Pass your app token/key with -k or export it as $PU_USER.'
        echo 'Use -h for a full list of options.'
elif [[ -z $PU_USER ]]; then
        echo 'User key missing. Pass your user key with -u or export it as $PU_TOKEN.'
        echo 'Use -h for a full list of options.'
elif [[ -z $PU_MESSAGE ]]; then
        echo 'Message can not be empty. Enter a message or run pushover with stdin.'
        echo 'Use -h for a full list of options.'
else
        curl -s -d "chat_id=$PU_USER&disable_web_page_preview=1&text=$PU_MESSAGE" -o /dev/null "https://api.telegram.org/bot$PU_TOKEN/sendMessage"
fi
