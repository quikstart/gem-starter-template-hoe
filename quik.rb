##
# note: hoe_plugins makro requires hoe
require 'hoe'


say "Hello from the gem quick starter wizard script (hoe classic edition)"

name  = ask "Name of the gem", "hola"

## use template repo e.g. github.com/quikstart/gem-starter-template-hoe

use "quikstart/gem-starter-template-hoe"


#####
# "macros" - add more "built-in" calculated variables/settings

def hoe_plugins
  ## e.g. Hoe.plugin :p1
  ##      Hoe.plugin :p2

  found = Gem.find_files("hoe/*.rb").map { |f| File.basename(f, ".rb").to_sym }
  extra = found - Hoe.plugins - [:rake]
  extra.map { |name| "# Hoe.plugin #{name.inspect}" }.sort.uniq.join("\n")
end

def make_sub_modules( klass )
  ## e.g. Pack::Subpack::Hola
  ##          =>
  ##      module Pack ; end
  ##      module Subpack ; end

  last = nil
  result = ""
  klass.split("::")[0..-2].each do |part|
    last = [last, part].compact.join("::")
    result << "module #{last}; end\n"
  end
  result << "\n" unless result.empty?
  result
end

def make_file_name( project )
  ## e.g. hola         => hola
  ##      pack-hola    => pack/hola

  file_name = project.gsub(/-/, "/")
  file_name
end

def make_ext_name( file_name )
  ## e.g. pack/hola   => hola
  File.basename( file_name )
end

def make_bin_file_name( file_name )
  # e.g. pack/hola   => pack_hola
  bin_file_name = file_name.gsub(/\//, "_")
  bin_file_name
end

def make_test_file_name( file_name )
  ## e.g. hola              => test_hola
  ##      pack/hola         => pack/test_hola
  ##      pack/subpack/hola => pack/subpack/test_hola

  dirname  = File.dirname( file_name )
  basename = File.basename( file_name )

  test_file_name = ''
  test_file_name << "#{dirname}/"      unless dirname.empty? || dirname == "." 
  test_file_name << "test_#{basename}"
  test_file_name
end

def make_klass( project )
  ## e.g. hola         => Hola
  ##      my_gem       => MyGem
  ##      pack-hola    => Pack::Hola
  klass = project.gsub(/(?:^|_)([a-z])/) { $1.upcase }
  klass = klass.gsub(/-([a-z])/) { "::#{$1.upcase}" }    # fix regex: was /(?:^|-)([a-z])/ - remove ^anchor
  klass
end

def make_test_klass( klass )
  ## e.g. Hola        => TestHola
  ##      Pack::Hola  => TestPack::TestHola
  test_klass = klass.gsub(/(^|::)([A-Z])/) { "#{$1}Test#{$2}" }
  test_klass
end


#####
# config block / settings used in templates and filenames/paths  e.g. $project$, $file_name$, etc.

config do |c|
  c.project        = name
  c.file_name      = make_file_name( c.project )
  c.ext_name       = make_ext_name( c.file_name )
  c.klass          = make_klass( c.project )
  c.test_klass     = make_test_klass( c.klass )

  # note: used by quik; if name present will get used for output dir
  #  (if not; uses current/working folder e.g. ./)
  c.name           = c.ext_name

  ## fix: some hoe sow bugs e.g. wrong entry in manifest if used w/ module -- add new $test_file_name$
  ## e.g. pack-hola becomes
  ##   pack/test_hola   (NOT test_pack/hola)
  c.test_file_name = make_test_file_name( c.file_name )
  c.bin_file_name  = make_bin_file_name( c.file_name )

  c.date        = Time.new.strftime("%Y-%m-%d")  ## e.g. use like $date$  => 2015-08-27
  c.year        = Time.new.strftime("%Y")        ## e.g. use like $year$  => 2015

  c.hoe_plugins = hoe_plugins()
  c.sub_modules_for_klass      = make_sub_modules( c.klass )
  c.sub_modules_for_test_klass = make_sub_modules( c.test_klass )
end  
