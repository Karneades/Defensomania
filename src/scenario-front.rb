require 'squib'

scenarios = Squib.csv file: '../cards/scenarios.tsv', col_sep: "\t"
layouts = 'layout-front.yml'

Squib::Deck.new cards: scenarios['Phase'].size, layout: layouts do

  ##
  ## Scenario Color Configuration
  ## => switch between black and white scenario cards.
  ##
  #scenario_color = 'white'
  scenario_color = 'black'

  background_color = scenarios['Phase'].map { |t|
      if scenario_color == 'black' then
          "black"
      else
          "white"
      end
  }
  background color: background_color

  text_color = scenarios['Phase'].map { |t|
      if scenario_color == 'black' then
          "white"
      else
          "black"
      end
  }

  text str: scenarios['Phase'], layout: 'title', color: text_color
  text str: scenarios['Activity'], layout: 'description', color: text_color
  text str: "Defensomania", layout: 'credits', color: text_color

  svg file: scenarios['Phase'].map { |t|
      if scenario_color == 'black' && t == "Scenario" then
          "icons/#{t.downcase}-white.svg"
      else
          "icons/#{t.downcase}.svg"
      end
  }, layout: 'illustration'

  build :png do
      save_png dir: '../PNGs-to-print/'
  end

  pdf_name = 'Defensomania-1-card-per-sheet-scenario-front-with-bleed.pdf'
  build :pdf1 do
      save_pdf file: pdf_name, dir: '../PDFs-to-print/', trim_radius: 0, sprue: 'sprue-1up-with-bleed.yml'
  end

  pdf_name = 'Defensomania-6-cards-per-sheet-scenario-front-with-croplines-and-bleed.pdf'
  build :pdf6 do
    rect layout: 'cut', stroke_color: :white, radius: 0
    save_pdf file: pdf_name, dir: '../PDFs-to-print'
  end

  pdf_name = 'Defensomania-9-cards-per-sheet-scenario-front-without-bleed.pdf'
  build :pdf9 do
    rect layout: 'cut', stroke_color: :white, radius: 0
    save_pdf file: pdf_name, dir: '../PDFs-to-print' , sprue: 'letter_poker_card_9up.yml', trim: '0.125in', trim_radius: 0
  end

  pdf_name = 'scenario-front-test.pdf'
  build :pdf1test do
      rect layout: 'safe', stroke_color: :red
      rect layout: 'cut', stroke_color: :white, radius: 0
      save_pdf file: pdf_name, trim_radius: 0, sprue: 'sprue-1up-with-bleed.yml'
  end

  build :pngtest do
      cut_zone radius: 0,  stroke_color: :white
      safe_zone radius: 0, stroke_color: :red
      save_png range: 0, sprue: 'sprue-1up-with-bleed.yml', trim_radius: 0
  end
end
