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
  background color: background_color

  text_color = scenarios['Phase'].map { |t|
      if scenario_color == 'black' && t == "Scenario" then
          "white"
      else
          "black"
      end
  }
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
    save_png
  end

  pdf_name = 'CyberAgainstHumanityScenarios.pdf'
  build :pdf do
    rect layout: 'cut'
    save_pdf file: pdf_name, dir: '../' #, sprue: 'a4_poker_card_8up.yml'
  end

  build :test do
    rect layout: 'cut'
    save_png range: 0
  end
end
