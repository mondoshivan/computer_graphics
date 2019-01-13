lib = File.expand_path("../../test", __FILE__)
$:.unshift(lib) unless $:.include?(lib)

require 'computer_graphics/matrix_spec'
require 'computer_graphics/matrix_row_spec'
require 'computer_graphics/transform_spec'