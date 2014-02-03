Book.destroy_all
Author.destroy_all

Author.create(
:name => 'Blog one',
:bio => 'I am a pretty good author however no one purchases my books',
:image => 'http://gzeta.net/wp-content/uploads/2012/03/author.gif'
)

Book.create(
:title => 'Book One',
:description => 'I am a pretty good book.',
:genre => 'New',
:image => 'http://www.choice.com.au/~/media/Images/Reviews/Money/Shopping%20and%20legal/2009/Online%20xmas%20shopping/Books_iStock_.ashx',
:ISBN => 123456789,
:author_id => Author.first.id
)