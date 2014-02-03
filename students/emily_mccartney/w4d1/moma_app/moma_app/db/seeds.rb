Artist.destroy_all
Painting.destroy_all

Artist.create(
  :name => 'Joan Miro',
  :period => '20th Century', 
  :nationality => 'Spanish', 
  :dob => '1983/04/20', 
  :image => 'http://upload.wikimedia.org/wikipedia/commons/5/5c/Portrait_of_Joan_Miro%2C_Barcelona_1935_June_13.jpg')

Painting.create(
  :title => 'Mona Lisa',
  :year => '1900',
  :medium => 'oil',
  :style => 'Portrait',
  :image => 'http://uploads6.wikipaintings.org/images/leonardo-da-vinci/mona-lisa.jpg')