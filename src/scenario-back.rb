require 'squib'

layouts = 'layout-back.yml'

Squib::Deck.new cards: 1, layout: layouts do

  rect layout: 'cut', fill_color: 'black'

  text str: "Scenario", layout: 'illustration', color: 'white'
  text str: "Cyber Against Humanity", layout: 'credits', color: 'white'

  build :png do
      save_png prefix: 'back_scenario_', dir: '../PNGs-to-print/'
  end

  pdf_name = 'CyberAgainstHumanity-1-card-per-sheet-scenario-back.pdf'
  build :pdf do
      save_pdf file: pdf_name, dir: '../PDFs-to-print/' , sprue: 'drivethrucards_1up.yml'
  end

  build :test do
      save_png range: 0, sprue: 'drivethrucards_1up.yml'
  end
end
