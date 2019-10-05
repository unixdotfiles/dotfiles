#!/bin/sh

for ext in $(<extensions)
do
  code --install-extension "$ext"
done
