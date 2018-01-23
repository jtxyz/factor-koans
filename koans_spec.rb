#!/usr/bin/env ruby

require_relative 'spec_helper'

in_a_clean_room do # so chill
  meditate
  i_should_see('Good luck on your journey')
  i_should_be_directed_to(line: 22, of_file: 'koans/tests/1-introduction.factor')
  then_i_fill_in('"Hello"')

  meditate
  i_should_see('You are progressing')
  i_should_be_directed_to(line: 9, of_file: 'koans/tests/2-words.factor')
  then_i_fill_in('fixed-greeting')

  meditate
  i_should_see('You are progressing')
  i_should_be_directed_to(line: 15, of_file: 'koans/tests/2-words.factor')
  then_i_fill_in('11')

  meditate
  i_should_see('You are progressing')
  i_should_be_directed_to(line: 21, of_file: 'koans/tests/2-words.factor')
  then_i_fill_in('t')

  meditate
  i_should_see('You are progressing')
  i_should_be_directed_to(line: 27, of_file: 'koans/tests/2-words.factor')
  then_i_fill_in('"yellow" "yellow" "brownish"')

  meditate
  i_should_see('You are progressing')
  i_should_be_directed_to(line: 40, of_file: 'koans/tests/2-words.factor')
  then_i_replace(content: 'stack-effect-greeting ( -- )', with: 'stack-effect-greeting ( -- greeting )')

  meditate
  i_should_see('You are progressing')
  i_should_be_directed_to(line: 22, of_file: 'koans/tests/3-conditionals.factor')
  then_i_fill_in('t')

  meditate
  i_should_see('You are progressing')
  i_should_be_directed_to(line: 23, of_file: 'koans/tests/3-conditionals.factor')
  then_i_fill_in('f')

  meditate
  i_should_see('You are progressing')
  i_should_be_directed_to(line: 26, of_file: 'koans/tests/3-conditionals.factor')
  then_i_fill_in('"a lovely bunch of coconuts"')

  meditate
  i_should_see('You are progressing')
  i_should_be_directed_to(line: 29, of_file: 'koans/tests/3-conditionals.factor')
  then_i_fill_in('"a lovely bunch of coconuts"')

  meditate
  i_should_see('You are progressing')
  i_should_be_directed_to(line: 38, of_file: 'koans/tests/3-conditionals.factor')
  then_i_fill_in('7')

  meditate
  i_should_see('You are progressing')
  i_should_be_directed_to(line: 51, of_file: 'koans/tests/3-conditionals.factor')
  then_i_fill_in('1')

  meditate
  i_should_see('You are progressing')
  i_should_be_directed_to(line: 79, of_file: 'koans/tests/3-conditionals.factor')
  then_i_fill_in('4')

  meditate
  i_should_see('You have achieved enlightenment.')
  i_should_see('Now go forth and factor.')
end

in_a_clean_room do # less-happy-path
  meditate
  i_should_be_directed_to(line: 22, of_file: 'koans/tests/1-introduction.factor')
  then_i_fill_in('"Hello"')

  meditate
  i_should_see('You are progressing')
  i_should_be_directed_to(line: 9, of_file: 'koans/tests/2-words.factor')

  meditate
  i_should_see('Do not lose hope!')
  i_should_be_directed_to(line: 9, of_file: 'koans/tests/2-words.factor')
  then_i_fill_in('"some-garbage"')

  meditate
  i_should_see('Do not lose hope!')
  i_should_be_directed_to(line: 9, of_file: 'koans/tests/2-words.factor')
  then_i_replace(content: '"some-garbage"', with: 'fixed-greeting')

  meditate
  i_should_see('You are progressing')
end

puts 'Your Koans are within normal operating parameters.'
puts 'I hope you enjoy enlightenment.'
