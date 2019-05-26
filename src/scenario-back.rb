require 'squib'

layouts = 'layout-back.yml'

Squib::Deck.new cards: 1, layout: layouts do

  background color: :black

  text str: "Scenario", layout: 'illustration', color: 'white'
  text str: "Cyber Against Humanity", layout: 'credits', color: 'white'

  build :png do
      save_png prefix: 'back_scenario_', dir: '../PNGs-to-print/'
  end

  pdf_name = 'CyberAgainstHumanity-1-card-per-sheet-scenario-back-with-bleed.pdf'
  build :pdf do
      save_pdf file: pdf_name, dir: '../PDFs-to-print/', trim_radius: 0, sprue: 'sprue-1up-with-bleed.yml'
  end

  build :test do
      rect layout: 'cut', stroke_color: :white
      rect layout: 'safe', stroke_color: :red
      save_png range: 0
  end
end
