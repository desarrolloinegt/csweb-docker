#!/bin/bash
set -e

# Start cron
cron

# Start Apache in the foreground
exec apache2-foreground
