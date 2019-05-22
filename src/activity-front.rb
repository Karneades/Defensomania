require 'squib'

activities = Squib.csv file: '../cards/activities.tsv', col_sep: "\t"
layouts = 'layout.yml'

Squib::Deck.new cards: activities['Phase'].size, layout: layouts do

  ##
  ## Scenario Color Configuration
  ## => switch between black and white scenario cards.
  ##
  #scenario_color = 'white'
  scenario_color = 'black'

  background_color = activities['Phase'].map { |t|
      if scenario_color == 'black' && t == "Scenario" then
          "black"
      else
          "white"
      end
  }
  #background color: background_color

  text_color = activities['Phase'].map { |t|
      if scenario_color == 'black' && t == "Scenario" then
          "white"
      else
          "black"
      end
  }

  rect layout: 'cut', fill_color: background_color

  text str: activities['Phase'], layout: 'title', color: text_color
  text str: activities['Activity'], layout: 'description', color: text_color
  text str: "Cyber Against Humanity", layout: 'credits', color: text_color

  svg file: activities['Phase'].map { |t|
      if scenario_color == 'black' && t == "Scenario" then
          "icons/#{t.downcase}-white.svg"
      else
          "icons/#{t.downcase}.svg"
      end
  }, layout: 'illustration'

  build :png do
    save_png dir: '../PNGs-to-print/'
  end

  pdf_name = 'CyberAgainstHumanity-1-card-per-sheet-activities-front.pdf'
  build :pdf1 do
      save_pdf file: pdf_name, dir: '../PDFs-to-print' , sprue: 'drivethrucards_1up.yml'
  end

  pdf_name = 'CyberAgainstHumanity-6-cards-per-sheet-with-croplines-activities-front.pdf'
  build :pdf6 do
    save_pdf file: pdf_name, dir: '../PDFs-to-print'
  end

  pdf_name = 'CyberAgainstHumanity-9-cards-per-sheet-without-croplines-activities-front.pdf'
  build :pdf9 do
    save_pdf file: pdf_name, dir: '../PDFs-to-print' , sprue: 'letter_poker_card_9up.yml'
  end

  build :test do
    save_png range: 0
  end
end
