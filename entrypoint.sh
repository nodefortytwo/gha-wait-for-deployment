
#!/bin/sh

set -e

while [ $MAX_TRIES -gt 0 ]
do
    VALUE=`curl -s  $URL | jq $QUERY -r`
    if [[ $VALUE = $DESIRED_VALUE ]]; then
        echo "Deploy complete!"
        exit 0
    else
        echo "$VALUE != $DESIRED_VALUE"
        MAX_TRIES=$((MAX_TRIES - 1))
    fi
    echo "Sleeping, $MAX_TRIES tries left"
    sleep $SECONDS_BETWEEN_CHECKS
done

exit 1