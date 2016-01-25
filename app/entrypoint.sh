#!/bin/bash
set -e

cd /app

if [ "$1" = 'producer' ]; then
    python producer.py
fi

if [ "$1" = 'consumer' ]; then
    python consumer.py
fi
