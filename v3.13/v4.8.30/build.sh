#!/bin/sh -l

sudo chmod a+rwx /home/builder/packages
abuild -r -c -q
