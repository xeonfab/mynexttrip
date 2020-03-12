module ApplicationHelper
  def int_as_stars(number)
    case number
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

  def int_as_safety_score(number)
    case number
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

  def int_as_cost_of_living_score(number)
    if number > 0 && number < 4.5
      "$$$$$"
    elsif number > 4.51 && number < 6
      "$$$$"
    elsif number > 6.01 && number < 7.5
      "$$$"
    elsif number > 7.51 && number < 8.8
      "$$"
    else number > 8.81 && number < 10
      "$"
    end
  end
end
