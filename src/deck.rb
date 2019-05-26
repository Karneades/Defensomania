require 'squib'

activities = Squib.csv file: '../cards/activities.tsv', col_sep: "\t"
scenarios = Squib.csv file: '../cards/scenarios.tsv', col_sep: "\t"

all_cards = activities
all_cards['Phase'] += scenarios['Phase']
all_cards['Activity'] += scenarios['Activity']

layouts = 'layout-front.yml'

# Calculate location in cards for each phase for showcase
cnt = 0
nr_prepare,nr_detect,nr_respond,nr_recover = -1, -1, -1, -1
nr_lessonslearned,nr_communication,nr_scenario = -1, -1, -1
all_cards['Phase'].each do |phase|
    case phase
    when 'Prepare'
        unless nr_prepare > -1
            nr_prepare = cnt
        end
    when 'Detect'
        unless nr_detect > -1
            nr_detect = cnt
        end
    when 'Respond'
        unless nr_respond > -1
            nr_respond = cnt
        end
    when 'Recover'
        unless nr_recover > -1
            nr_recover = cnt
        end
    when 'Lessons Learned'
        unless nr_lessonslearned > -1
            nr_lessonslearned = cnt
        end
    when 'Communication'
        unless nr_communication > -1
            nr_communication = cnt
        end
    when 'Scenario'
        unless nr_scenario > -1
            nr_scenario = cnt
        end
    end
    cnt += 1
end
position_each_category = [nr_prepare,nr_detect,nr_respond,nr_recover,nr_lessonslearned,nr_communication,nr_scenario]

# generate card deck
Squib::Deck.new cards: all_cards['Phase'].size, layout: layouts do

  ##
  ## Scenario Color Configuration
  ## => switch between black and white scenario cards.
  ##
  #scenario_color = 'white'
  scenario_color = 'black'

  background_color = all_cards['Phase'].map { |t|
      if scenario_color == 'black' && t == "Scenario" then
          "black"
      else
          "white"
      end
  }
  background color: background_color

  text_color = all_cards['Phase'].map { |t|
      if scenario_color == 'black' && t == "Scenario" then
          "white"
      else
          "black"
      end
  }

  text str: all_cards['Phase'], layout: 'title', color: text_color
  text str: all_cards['Activity'], layout: 'description', color: text_color
  text str: "Cyber Against Humanity", layout: 'credits', color: text_color

  svg file: all_cards['Phase'].map { |t|
      if scenario_color == 'black' && t == "Scenario" then
          "icons/#{t.downcase}-white.svg"
      else
          "icons/#{t.downcase}.svg"
      end
  }, layout: 'illustration'

  build :showcase do
    showcase file: 'showcase.png', dir: '../img/', range: position_each_category
    hand file: 'hand.png', dir: '../img/', range: position_each_category, trim: 30, trim_radius: 10, angle_range: -1.4..1.2
  end

  # with bleed
  build :png do
      save_png dir: '../PNGs-to-print/'
  end

  build :pdf1 do
      pdf_name = 'CyberAgainstHumanity-1-card-per-sheet-all-front-with-bleed.pdf'
      save_pdf file: pdf_name, dir: '../PDFs-to-print/', \
          sprue: 'sprue-1up-with-bleed.yml', trim_radius: 0
  end

  build :pdf6 do
    pdf_name = 'CyberAgainstHumanity-6-cards-per-sheet-all-front-with-croplines-and-bleed.pdf'
    rect layout: 'cut', stroke_color: text_color, radius: 16
    save_pdf file: pdf_name, dir: '../PDFs-to-print/', radius: 38
  end

  build :pdf9 do
    pdf_name = 'CyberAgainstHumanity-9-cards-per-sheet-all-front-without-bleed.pdf'
    rect layout: 'cut', stroke_color: text_color, radius: 0
    save_pdf file: pdf_name, dir: '../PDFs-to-print/', \
        sprue: 'letter_poker_card_9up.yml', trim: '0.125in', trim_radius: 0
  end

  pdf_name = 'all-front-test.pdf'
  build :pdf1test do
      rect layout: 'safe', stroke_color: :red
      rect layout: 'cut', stroke_color: text_color, radius: 0
      save_pdf file: pdf_name, trim_radius: 0, sprue: 'sprue-1up-with-bleed.yml'
  end

  build :pngtest do
      rect layout: 'cut', stroke_color: text_color, radius: 0
      rect layout: 'safe', stroke_color: :red
      save_png range: 0, sprue: 'sprue-1up-with-bleed.yml', trim_radius: 0
  end
end
