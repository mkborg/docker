#!/bin/bash -ex

[[ ! -d mysw ]] || rm -rf mysw ]]

vde_plug switch://`pwd`/mysw slirp://
