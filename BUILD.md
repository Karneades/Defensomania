# Build your own Cyber Against Humanity

Generate your own card deck based on the list of [activities and
scenarios](cards). [Squib](https://github.com/andymeneely/squib) is used for
making the card deck. See
[installation](https://squib.readthedocs.io/en/latest/install.html) in the docs
for more information on how to install Squib. 

Change to the `src` directory and run the following commands as needed. 

Build test card (_\_output/card_00.png_)

``` ruby
$ SQUIB_BUILD=test ruby deck.rb 
```

Build pdf including activities and scenarios (_../CyberAgainstHumanity.pdf_).
Set `scenario_color` to _white_ or _black_ in the source file.

``` ruby
$ SQUIB_BUILD=pdf ruby deck.rb 
```

Build pdf for only scenario cards (_../CyberAgainstHumanityScenarios.pdf_)
Set `scenario_color` to _white_ or _black_ in the source file.

``` ruby
$ SQUIB_BUILD=pdf ruby scenario_deck.rb 
```

Build pdf for worst response pack (_../CyberAgainstWorstHumanity.pdf_)
Set `scenario_color` to _white_ or _black_ in the source file.

``` ruby
$ SQUIB_BUILD=pdf ruby worst_deck.rb 
```

Build showcase (_../img/showcase.png_)

``` ruby
$ SQUIB_BUILD=showcase ruby deck.rb 
```

Build hand (_../img/hand.png_)

``` ruby
$ SQUIB_BUILD=hand ruby deck.rb 
```

Build png files for each card (_\_output/card\_*.png_)

``` ruby
$ SQUIB_BUILD=png ruby deck.rb 
```

Build png files for each scenario card (_\_output/card\_*.png_)

``` ruby
$ SQUIB_BUILD=png ruby scenario_deck.rb 
```
