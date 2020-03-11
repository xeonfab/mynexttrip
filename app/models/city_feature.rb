class CityFeature < ApplicationRecord
  belongs_to :city
  belongs_to :feature

  def cost_of_living_score
    if score > 0 && score < 4.5
      "$$$$$"
    elsif score > 4.51 && score < 6
      "$$$$"
    elsif score > 6.01 && score < 7.5
      "$$$"
    elsif score > 7.51 && score < 8.8
      "$$"
    else score > 8.81 && score < 10
      "$"
    end
  end

  def star_score
    case score
    when 0..20
      '<i class="fas fa-star star1"></i>'.html_safe
    when 20.01..40
      '<i class="fas fa-star star1"></i><i class="fas fa-star star1"></i>'.html_safe
    when 40.01..60
      '<i class="fas fa-star star1"></i><i class="fas fa-star star1"></i><i class="fas fa-star star1"></i>'.html_safe
    when 60.01..80
      '<i class="fas fa-star star1"></i><i class="fas fa-star star1"></i><i class="fas fa-star star1"></i><i class="fas fa-star star1"></i>'.html_safe
    when 80.01..100
      '<i class="fas fa-star star1"></i><i class="fas fa-star star1"></i><i class="fas fa-star star1"></i><i class="fas fa-star star1"></i><i class="fas fa-star star1"></i>'.html_safe
    end
  end

  def safety_score
    case score
    when 0..20
      '<span class="badge badge-danger">Dangerous</span>'.html_safe
    when 20.01..40
      '<span class="badge badge-danger">Average Danger</span><span class="badge badge-danger">Unsafe</span>'.html_safe
    when 40.01..60
      '<span class="badge badge-warning">Average</span>'.html_safe
    when 60.01..80
      '<span class="badge badge-success">Safe</span>'.html_safe
    when 80.01..100
      '<span class="badge badge-success">Extremely Safe</span>'.html_safe
    end
  end
end
