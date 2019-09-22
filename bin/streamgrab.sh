#!/bin/bash
if [ $# -eq 0 ]; then
  channelId={replace_with_default_channel}
else
  channelId=$1
fi

while true; do
  m3u8=$(youtube-dl -i -f best \
	-g https://www.youtube.com/channel/$channelId/live)

  if [[ "$m3u8" == *.m3u8 ]]; then
	#Send start notification
	. $HOME/livestreams/bin/push_notification.sh -u {replace_with_telegram_user_id} \
	-k {replace_with_telegram_bot_key} \
	"Downloading from https://www.youtube.com/channel/$channelId/live"
	#Copy stream to .ts file
	ffmpeg -rw_timeout 20000000 -i "$m3u8" -t 00:30:00 -c copy \
	$HOME/livestreams/archive/stream-$(date '+%Y-%m-%d.%H.%M.%S').ts
	#Send end notification
	. $HOME/livestreams/bin/push_notification.sh -u {replace_with_telegram_user_id} \
	-k {replace_with_telegram_bot_key} \
	"Done downloading from https://www.youtube.com/channel/$channelId/live"
  fi

  sleep 1
done
