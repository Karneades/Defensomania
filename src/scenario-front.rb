require 'squib'

scenarios = Squib.csv file: '../cards/scenarios.tsv', col_sep: "\t"
layouts = 'layout.yml'

Squib::Deck.new cards: scenarios['Phase'].size, layout: layouts do

  ##
  ## Scenario Color Configuration
  ## => switch between black and white scenario cards.
  ##
  #scenario_color = 'white'
  scenario_color = 'black'

  background_color = scenarios['Phase'].map { |t|
      if scenario_color == 'black' && t == "Scenario" then
          "black"
      else
          "white"
      end
  }
  #background color: background_color

  text_color = scenarios['Phase'].map { |t|
      if scenario_color == 'black' && t == "Scenario" then
          "white"
      else
          "black"
      end
  }

  rect layout: 'cut', fill_color: background_color

  text str: scenarios['Phase'], layout: 'title', color: text_color
  text str: scenarios['Activity'], layout: 'description', color: text_color
  text str: "Cyber Against Humanity", layout: 'credits', color: text_color

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

  pdf_name = 'CyberAgainstHumanity-1-card-per-sheet-scenarios-front.pdf'
  build :pdf1 do
      save_pdf file: pdf_name, dir: '../PDFs-to-print', sprue: 'drivethrucards_1up.yml'
  end

  pdf_name = 'CyberAgainstHumanity-6-cards-per-sheet-with-croplines-scenarios-front.pdf'
  build :pdf6 do
    save_pdf file: pdf_name, dir: '../PDFs-to-print'
  end

  pdf_name = 'CyberAgainstHumanity-9-cards-per-sheet-without-croplines-scenarios-front.pdf'
  build :pdf9 do
    save_pdf file: pdf_name, dir: '../PDFs-to-print' , sprue: 'letter_poker_card_9up.yml'
  end

  build :test do
    save_png range: 0, sprue: 'drivethrucards_1up.yml'
  end
end
