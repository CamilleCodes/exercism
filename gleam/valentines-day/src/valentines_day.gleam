// TODO: please define the 'Approval' custom type
pub type Approval {
  Yes
  No
  Maybe
}

// TODO: please define the 'Cuisine' custom type
pub type Cuisine {
  Korean
  Turkish
}

// TODO: please define the 'Genre' custom type
pub type Genre {
  Crime
  Horror
  Romance
  Thriller
}

// TODO: please define the 'Activity' custom type
pub type Activity {
  BoardGame
  Chill
  Movie(Genre)
  Restaurant(Cuisine)
  Walk(Int)
}

fn romance_roulette(genre: Genre) -> Approval {
  case genre {
    Romance -> Yes
    _ -> No
  }
}

fn cuisine_selector(cuisine: Cuisine) -> Approval {
  case cuisine {
    Korean -> Yes
    Turkish -> Maybe
  }
}

fn take_a_walk(km: Int) -> Approval {
  case km {
    _ if km > 11 -> Yes
    _ if km > 6 -> Maybe
    _ -> No
  }
}

pub fn rate_activity(activity: Activity) -> Approval {
  case activity {
    Movie(genre) -> romance_roulette(genre)
    Restaurant(cuisine) -> cuisine_selector(cuisine)
    Walk(km) -> take_a_walk(km)
    _ -> No
  }
}
