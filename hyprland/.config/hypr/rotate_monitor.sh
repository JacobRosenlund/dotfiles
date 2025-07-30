#!/bin/sh

MONITOR="$1"
#DIRECTION="$2"
DIRECTION="${2:-cw}"

# Get current transform
CURRENT=$(hyprctl monitors | awk -v mon="$MONITOR" '
  $2 == mon {found=1}
  found && /transform/ {print $2; exit}
')
CURRENT=${CURRENT:-0}

if [[ "$DIRECTION" == "cw" ]]; then
  NEXT=$(( (CURRENT + 1) % 4 ))
elif [[ "$DIRECTION" == "ccw" ]]; then
  NEXT=$(( (CURRENT + 3) % 4 ))
else
  echo "Invalid direction: use 'cw' or 'ccw'"
  exit 1
fi

# Apply new transform
hyprctl keyword monitor $MONITOR,preferred,auto,1,transform,$NEXT

echo "Rotated $MONITOR from $CURRENT to $NEXT"
