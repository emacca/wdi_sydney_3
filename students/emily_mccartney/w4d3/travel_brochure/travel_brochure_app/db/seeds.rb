Destination.destroy_all
Attraction.destroy_all

Destination.create(
  :name => 'Paris',
  :location => 'France',
  :description => 'They all speak French'
)

Attraction.create(
  :name => 'Eiffel Tower',
  :image=> 'http://upload.wikimedia.org/wikipedia/commons/5/57/Eiffel_Tower_during_1889_Exposition.jpg',
  :destination_id => Destination.first
)