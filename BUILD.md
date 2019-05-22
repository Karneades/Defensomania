# Build your own Cyber Against Humanity

Generate your own card deck based on the list of [activities and
scenarios](cards). [Squib](https://github.com/andymeneely/squib) is used for
making the card deck. See
[installation](https://squib.readthedocs.io/en/latest/install.html) in the docs
for more information on how to install Squib. 

Change to the `src` directory and run the following commands as needed.

Build test card (_\_output/card_00.png_)

``` ruby
rake test
```

Build a PDF including all front cards (_../PDFs-to-print/*_). Set `scenario_color` to _white_ or _black_ in the source file.

``` ruby
# use default job pdf6 - 6-cards-per-sheet using all front cards
rake

# build PDF with 1-card-per-sheet
rake pdf1
# build PDF with 6-card-per-sheet with crop lines
rake pdf6
# build PDF with 9-card-per-sheet 
rake pdf6
```

Build dedicated PDF for activities and scenarios and for front and back using **1-card-per-sheet** (_../PDFs-to-print/*_). Set `scenario_color` to _white_ or _black_ in the source file.

``` ruby
rake pdf1all
```

Build PNG files for each front and back card (_../PNGs-to-print/*_)

``` ruby
rake png
```

Build showcase (_../img/showcase.png_ and _../img/hand.png_)

``` ruby
rake showcase
```

Build PDF for only scenario or activity cards for different layouts (_../PDFs-to-print/*_)
Set `scenario_color` to _white_ or _black_ in the source file.

``` ruby
rake pdf1scenario
rake pdf6scenario
rake pdf9scenario
rake pdf1activity
rake pdf6activity
rake pdf9activity
```

Build PDF for worst response pack (_../PDFs-to-print/*_)
Set `scenario_color` to _white_ or _black_ in the source file.

``` ruby
$ SQUIB_BUILD=pdf6 ruby worst_deck.rb 
```

Build PNG files for each scenario card (_../PNGs-to-print/*_)

``` ruby
$ SQUIB_BUILD=png ruby scenario_deck.rb 
```

Build PNG files for each activities card (_../PNGs-to-print/*_)

``` ruby
$ SQUIB_BUILD=png ruby activity_deck.rb 
```
