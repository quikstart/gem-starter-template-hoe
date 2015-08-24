# Notes


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


## Links

add some more hoe links here


## Todos

- [ ]  set file mode for files in /bin/ e.g. chmod a+x
    - check if file mode gets lost in unpacking of zip ??
    - possible to ship zip archive w/ file mode set ???





