#!/bin/sh

die() {
  echo "Terminating..."
  exit 1
}

trap die TERM

echo "Waiting..."

# restart daily
sleep 86400 &
wait
