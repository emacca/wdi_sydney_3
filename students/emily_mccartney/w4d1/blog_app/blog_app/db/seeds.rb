Post.destroy_all

Post.create(
  :title => 'Blog one',
  :description => 'I am a description, this is zoo not cool, please be a testing description.',
  :content => 'use destroy_all as it looks at all the validations and runs them, this is put in the seeds file so we can run it multiple files and the artist won’t be created 10000 times.',
  :author => 'Joe Doey'
)