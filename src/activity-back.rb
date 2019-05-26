require 'squib'

layouts = 'layout-back.yml'

Squib::Deck.new cards: 1, layout: layouts do

  background color: :white

  text str: "Activity", layout: 'illustration', color: 'black'
  text str: "Cyber Against Humanity", layout: 'credits', color: 'black'

  build :png do
      save_png prefix: 'back_activity_', dir: '../PNGs-to-print/'
  end

  pdf_name = 'CyberAgainstHumanity-1-card-per-sheet-activity-back-with-bleed.pdf'
  build :pdf do
      save_pdf file: pdf_name, dir: '../PDFs-to-print/' , sprue: 'sprue-1up-with-bleed.yml'
  end

  build :test do
      rect layout: 'cut', stroke_color: :black
      rect layout: 'safe', stroke_color: :red
      save_png range: 0
  end

end
