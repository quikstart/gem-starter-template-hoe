# gem starter template - classic hoe version

An alternative gem starter template - use the "classic" gem starter template from the hoe gem.


## Notes

As input requires the gem name called project (in sow) and sow (auto-)derives all other names. Example:

Example 1 - project: hello

- klass -> Hello
- test_klass -> TestHello
- modules -> 
- filename -> hello  (same as projet) - used ??

```ruby
class Hello
  ...
end
```

Example 2 - project: pack-hello

- klass -> Pack::Hello
- test_klass -> TestPack::TestHello
- modules -> Pack
- filename -> hello ???  or pack/hello ??

```ruby
module Pack ; end

class Pack::Hello
  ...
end
```

Example 3 - project: pack-subpack-hello_world

- klass -> Pack::Subpack::HelloWorld
- test_klass -> TestPack::TestSubpack::TestHelloWorld
- modules -> Pack, Subpack
- filename -> hello_world

```ruby
module Pack ; end
module Subpack ; end

class Pack::Subpack::HelloWorld
  ...
end
```


## Sources

See the [hoe/template](https://github.com/seattlerb/hoe/tree/master/template) folder in the hoe source repo
for the original template.

See the [hoe/bin/sow](https://github.com/seattlerb/hoe/blob/master/bin/sow) binary - command line tool source - for
the original "hand-coded" built-in template merger machinery.


**Formula for Deriving Names**

```ruby

```
