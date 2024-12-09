// find the menu of the canteen that belongs to the faculty with the name 'MFF'
MATCH (faculty:Faculty {name: 'MFF'})<-[:BELONGS_TO]-(canteen:Canteen)
RETURN canteen.menu