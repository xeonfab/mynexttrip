class CityFeaturesController < ApplicationController

  def score(score)

    case score
    when (0..0.19)
      "very_bad"
    when (0.20..0.39)
      "bad"
    when (0.40..0.59)
      "average"
    when (0.60..0.79)
      "good"
    when (0.80..1)
      "very_good"

  end

end

