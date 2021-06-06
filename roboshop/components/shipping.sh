#!/bin/bash

source components/common.sh
## Deleting the previous log content before executing
rm -f /tmp/roboshop.log
set-hostname shipping

MAVEN "shipping"

APP_USER_ADD


