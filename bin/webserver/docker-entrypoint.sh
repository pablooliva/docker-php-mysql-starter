#!/bin/bash
composer install --no-interaction
exec "$@"