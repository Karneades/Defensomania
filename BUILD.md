# Build your own Defensomania

Generate your own card deck based on the list of [activities and
scenarios](cards). [Squib](https://github.com/andymeneely/squib) is used for
making the card deck. See
[installation](https://squib.readthedocs.io/en/latest/install.html) in the docs
for more information on how to install Squib. 

Change to the `src` directory and run the following commands as needed.

See which rake tasks are defined

```
rake -T
rake -T png
rake -T pdf
rake -T test
```

Build test card (_\_output/card_00.png_). The test PNG file includes the cut
line and a red line which indicates the safe zone.

``` ruby
rake test_png
```

Build a PDF which will include all front cards (_../PDFs-to-print/*_). Set `scenario_color` to _white_ or _black_ in the source file.

``` ruby
# build a PDF with 9-cards-per-sheet without bleed
rake
rake pdf6all

# build PDF with 1-card-per-sheet with bleed
rake pdf1all

# build PDF with 6-card-per-sheet with crop lines and with bleed
rake pdf6all
```

Build dedicated PDFs for activities and for scenarios front cards and PDFs for front and back using **1-card-per-sheet** and with bleed (_../PDFs-to-print/*_). Set `scenario_color` to _white_ or _black_ in the source file.

``` ruby
rake pdf1all

# the following rake tasks will then be executed
rake pdf1activity
rake pdf1activity_back
rake pdf1scenario
rake pdf1scenario_back
```

Build PNG files for each front and back card with bleed (_../PNGs-to-print/*_)

``` ruby
rake png

# the following rake tasks will then be executed
rake pngfront
rake png_scenario_back
rake png_activity_back
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
$ SQUIB_BUILD=png ruby scenario_front.rb 
```

Build PNG files for each activities card (_../PNGs-to-print/*_)

``` ruby
$ SQUIB_BUILD=png ruby activity_front.rb 
```
