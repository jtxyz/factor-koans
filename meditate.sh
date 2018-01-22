#!/usr/bin/env bash

if ! which factor >/dev/null ; then
  echo 'We could not find a factor executable on your $PATH'
  echo 'Please ensure that factor is installed correctly.'
  exit 1
fi

export FACTOR_ROOTS=$PWD
factor -run=koans

