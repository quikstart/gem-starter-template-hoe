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


## More (Alternative) Quick Starter Templates / Scripts

See the [Rubyref's Scripts](https://github.com/rubyref/scripts) library or try:

```
$ quik ls
```

to list all "official" registered quick starter templates / scripts.


## Questions? Comments?

Send them along to the ruby-talk mailing list.
Thanks!
