echo "Control Demon started"

while true; do
  	if [ `stat --format=%Y ../../../tmp/stream/pic.jpg` -le $(( `date +%s` - 5 )) ]; then 
	echo "Cam not running"
	sudo nohup ./start_stream.sh
	echo "Cam restarted"
	fi
	sleep 5
done
