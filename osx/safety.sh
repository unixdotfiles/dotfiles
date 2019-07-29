#!/bin/sh
rm -rf ~/.zoomus; touch ~/.zoomus && chmod 555 ~/.zoomus; pkill "ZoomOpener"
rm -rf ~/.ringcentralopener; touch ~/.ringcentralopener && chmod 555 ~/.ringcentralopener; pkill "RingCentralOpener"
rm -rf ~/.zhumuopener; touch ~/.zhumuopener && chmod 555 ~/.zhumuopener; pkill "ZhumuOpener"
