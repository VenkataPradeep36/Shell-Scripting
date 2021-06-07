#!/bin/bash

source components/common.sh
## Deleting the previous log content before executing
rm -f /tmp/roboshop.log
set-hostname cart

NODEJS "cart"