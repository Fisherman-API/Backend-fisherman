const regs = [
  {
    'id': '1',
    'name': 'Red Fish',
    'region': 'Atlantic Ocean',
    'rules': 'catch&release',
    'seasons': 'All Year'

  },
  {
    'id': '2',
    'name': 'Pollock',
    'region': 'North Pacific Ocean',
    'rules': '1 Adult perDay, 20 per Year',
    'seasons': 'All Year'
  },
  {
    'id': '3',
    'name': 'Flounder',
    'region': 'Northern Cali through tg=he bering Sea',
    'rules': '1 Adult per day, 20 per Year',
    'seasons': 'oct-dec'
  },
  {
    'id': '4',
    'name': 'Atlantic Bigeye Tuna',
    'region': 'Atlantic, Pacific, Indian Oceans',
    'rules': 'catch limit may vary',
    'seasons': 'All Year'
  },
  {
    'id': '5',
    'name': 'Atlantic BlackTip Shark',
    'region': 'Gulf of Mexico',
    'rules': 'shark dealer permit required, limit 4 per year',
    'seasons': 'All Year'
  },
  {
    'id': '6',
    'name': 'Atlantic Chub Mackerel',
    'region': 'Western Atlantic Ocean range',
    'rules': 'permit required to harvest, Catch&release',
    'seasons': 'All Year'
  },
  {
    'id': '7',
    'name': 'Atlantic Cod',
    'region': 'NorthWest Atlantic',
    'rules': 'Catch&release juveniles, permit required, 2 per day',
    'seasons': 'All Year'
  },
  {
    'id': '8',
    'name': 'Atlantic Common Thresher Shark',
    'region': 'Northwest Atlantic Ocean',
    'rules': 'Shark dealer permit required, 2 per year',
    'seasons': 'All Year'
  },
  {
    'id': '9',
    'name': 'Atlantic Halibut',
    'region': 'Gulf of main',
    'rules': '1 per day',
    'seasons': 'May.1-End of Year'
  },
  {
    'id': '10',
    'name': 'Rock Fish',
    'region': 'Marine zone',
    'rules': '5 per day to Sep 5, 4 per day after Sep 6',
    'seasons': 'All Year'
  },
  {
    'id': '11',
    'name': 'Stripped Bass',
    'region': 'Columbia zone',
    'rules': 'No Limit, Any Size',
    'seasons': 'All Year'

  },
  {
    'id': '12',
    'name': 'Blue Gill',
    'region': 'Columbia zone',
    'rules': 'No Limit, Any Size',
    'seasons': 'All Year'
  },
  {
    'id': '13',
    'name': 'Cat Fish',
    'region': 'Columbia zone',
    'rules': 'No Limit, Any Size',
    'seasons': 'All Year'
  },
  {
    'id': '14',
    'name': 'crappie',
    'region': 'Columbia zone',
    'rules': 'No Limit, Any Size',
    'seasons': 'All Year'
  },
  {
    'id': '15',
    'name': 'Sun Fish',
    'region': 'Columbia zone',
    'rules': 'No Limit, Any Size',
    'seasons': 'All Year'
  },
  {
    'id': '16',
    'name': 'WallEye',
    'region': 'Columbia zone',
    'rules': 'No Limit, Any Size',
    'seasons': 'All Year'
  },
  {
    'id': '17',
    'name': 'Perch',
    'region': 'Columbia zone',
    'rules': 'No Limit, Any Size',
    'seasons': 'All Year'
  },
  {
    'id': '18',
    'name': 'Tuna',
    'region': 'Marine zone',
    'rules': 'Keep any size, bag limit 25,',
    'seasons': 'All Year'
  },
  {
    'id': '19',
    'name': 'Flat Fish',
    'region': 'Marine zone',
    'rules': '25 per year',
    'seasons': 'All Year'
  },
  {
    'id': '20',
    'name': 'SurfPerch',
    'region': 'Marine zone',
    'rules': '15 per day',
    'seasons': 'All Year'
  },

];
  
module.exports = { regs };
