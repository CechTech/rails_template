# frozen_string_literal: true

require_relative 'support'
require_relative 'process_decorator'

def source_paths
  [__dir__]
end

self.class.prepend ProcessDecorator

install_generators

configure_database

add_blank_line 'Gemfile', "gem 'rails'"
remove_lines 'Gemfile', 'tzinfo-data'

directory 'inserts', 'tmp/inserts'

run 'bundle install'

after_bundle do
  remove_dir 'app/assets'

  run 'spring stop'

  install_rails_linters
  install_frontend_linters
  install_tests
  install_devise

  configure_application
  configure_frontend

  install_overcommit

  remove_dir 'tmp/inserts'

  run 'rails db:seed'

  run 'rspec'

  # run 'rubocop --auto-correct-all'
  # run 'yarn run eslint . --fix'
end
