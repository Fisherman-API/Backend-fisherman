const regs = [
  {
    'id': '1',
    'name': 'Trout',
    'region': 'Willamette zone',
    'rules': 'lake: 5, steams: catch&release',
    'seasons': 'lake: All Year, steams: May.22-Oct.31'

  },
  {
    'id': '2',
    'name': 'Salmon',
    'region': 'Willamette zone',
    'rules': '2 Adult perDay, 20 per Year',
    'seasons': 'closed for wild salmon'
  },
  {
    'id': '3',
    'name': 'StealHead',
    'region': 'Willamette zone',
    'rules': '3 Adult per day, 20 per Year',
    'seasons': 'closed for wild StealHead'
  },
  {
    'id': '4',
    'name': 'Sturgeon',
    'region': 'Willamette zone',
    'rules': 'catch&release Only, Must be over 54in',
    'seasons': 'All Year'
  },
  {
    'id': '5',
    'name': 'Bass',
    'region': 'Columbia zone',
    'rules': 'No Limit, Any Size',
    'seasons': 'All Year'
  },
  {
    'id': '6',
    'name': 'Shad',
    'region': 'Columbia zone',
    'rules': 'No Limit, Any Size',
    'seasons': 'All Year'
  },
  {
    'id': '7',
    'name': 'Smelt',
    'region': 'Columbia zone',
    'rules': 'Unlawful to take or attempt to take',
    'seasons': 'NO LAWFUL SEASONS'
  },
  {
    'id': '8',
    'name': 'lingcod',
    'region': 'Marine zone',
    'rules': '22in minimum, Bag limit subject to change',
    'seasons': 'All Year'
  },
  {
    'id': '9',
    'name': 'Halibut',
    'region': 'Marine zone',
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

];
  
module.exports = { regs };
