# Gem Quick Starter Template - Hoe Classic Edition

An alternative gem quick starter template - uses the "classic" template from the hoe gem.
Try:

```
$ quik new gem-hoe
```

This will download and run
the [`gem-hoe.rb`](https://github.com/rubyref/scripts/blob/master/gem-hoe.rb)
quik starter wizard script.
Resulting in:

```
Hello from the gem quick starter wizard script (hoe classic edition)

Q: Name of the gem? [hola]: hola

Thanks! Ready-to-go. Stand back.

  Downloading Gem Starter Template (Hoe Classic Edition)...
  Setting up Gem Starter Template (Hoe Classic Edition)...
  ...
  Merging templates...
    name:  "hola"
    klass: "Hola"
    test_klass: "TestHola"
    ...
Done.
```

Resulting in:

```
hola
├── bin
|   └── hola
├── lib
|   └── hola.rb
├── test
|   └── test_hola.rb
├── History.txt
├── Manifest.txt
├── Rakefile
└── README.txt
```


Note: The script also works with module names - use the "standard" gem naming patterns/convention
e.g.  use `mundo-hola` for `Mundo::Hola` and so on. Resulting in:

```
hola
├── bin
|   └── mundo_hola
├── lib
|   └── mundo
|       └── hola.rb
├── test
|   └── mundo
|       └── test_hola.rb
├── History.txt
├── Manifest.txt
├── Rakefile
└── README.txt
```

That's it.



## Hoe Notes

The how (sow) tool requires the gem name called project as the (only) input
and (auto-)derives all other names. Example:

### Example 1 - project: `hello`

- klass          => `Hello`
- test_klass     => `TestHello`
- file_name      => `hello`
- ext_name       => `hello`
- test_file_name => `test_hello`
- bin_file_name  => `hello`
- modules        =>


1) `lib/hello.rb`:

```ruby
class Hello
  ...
end
```

2) `test/test_hello.rb`:

```ruby
class TestHello < Minitest::Test
  ...
end
```


### Example 2 - project: `pack-hello`

- klass          => `Pack::Hello`
- test_klass     => `TestPack::TestHello`
- file_name      => `pack/hello`
- ext_name       => `hello`
- test_file_name => `pack/test_hello`
- bin_file_name  => `pack_hello`
- modules        => `Pack`


1) `lib/pack/hello.rb`:

```ruby
module Pack ; end

class Pack::Hello
  ...
end
```

2) `test/pack/test_hello.rb`:

```ruby
module TestPack ; end

class TestPack::TestHello < Minitest::Test
  ...
end
```


### Example 3 - project: `pack-subpack-hello_world`

- klass          => `Pack::Subpack::HelloWorld`
- test_klass     => `TestPack::TestSubpack::TestHelloWorld`
- file_name      => `pack/subpack/hello_world`
- ext_name       => `hello`
- test_file_name => `pack/subpack/test_hello_world`
- bin_file_name  => `pack_subpack_hello_world`
- modules        => `Pack`, `Subpack`

1) `lib/pack/subpack/hello_world.rb`:

```ruby
module Pack ; end
module Pack::Subpack ; end

class Pack::Subpack::HelloWorld
  ...
end
```

2) `test/pack/subpack/test_hello_world.rb`:

```ruby
module TestPack ; end
module TestPack::TestSubpack ; end

class Testpack::Testsubpack::TestHelloWorld < Minitest::Test
  ...
end
```


## Sources

See the [hoe/template](https://github.com/seattlerb/hoe/tree/master/template) folder in the hoe source repo
for the original template.

See the [hoe/bin/sow](https://github.com/seattlerb/hoe/blob/master/bin/sow) bin(ary) command line tool source for
the original "hand-coded" built-in template merger machinery.


**Formula for Deriving Names**

```ruby
project    = project.gsub(/([A-Z])/, '_\1').downcase.sub(/^_/, "")

klass      = project.gsub(/(?:^|_)([a-z])/) { $1.upcase }
klass      = klass.  gsub(/(?:^|-)([a-z])/) { "::#{$1.upcase}" }

test_klass = klass.  gsub(/(^|::)([A-Z])/) { "#{$1}Test#{$2}" }

file_name  = project.gsub(/-/, "/")
```

Comments from the source:

> Project names are lowercase with `_` separating package parts and `-` separating extension parts.
>
> File names are lowercase with `_` separating package parts and `/` separating
> extension parts.  `net-http-persistent` becomes `net/http/persistent`.
>
> Klass names are `CamelCase` with `::` separating extension parts.
>
> Test klass names are same as Klass with Test prepended to each part.  


## Questions? Comments?

Send them along to the ruby-talk mailing list.
Thanks!
