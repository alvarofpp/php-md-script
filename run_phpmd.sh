#!/usr/bin/env bash

# You choose the options below
options=(unusedcode cleancode codesize controversial design naming)
# You choose the files that will be excluded of php-md
excludes=(node_modules vendor tests app/Rules app/Console/Kernel.php _ide_helper.php .phpstorm.meta.php database/)

# @description Joins all the passed arguments, using comma(',') as separator
#
# @example
#   join_elements a b c
#   echo a,b,c
#
# @arg $@ Elements you want to join
#
# @stdout All arguments together, with comma(',') between them
#
# @see join_elements()
function join_elements {
  local IFS=",";
  echo "$*";
}

option=$(join_elements "${options[@]}")
exclude=$(join_elements "${excludes[@]}")

# Execute PHP Mess Detector
./vendor/phpmd/phpmd/src/bin/phpmd . html $option --suffixes php --reportfile phpmd.report.html --exclude $exclude