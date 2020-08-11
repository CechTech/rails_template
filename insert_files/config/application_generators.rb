config.generators do |generator|
  generator.test_framework :rspec
  generator.template_engine :slim
  generator.stylesheets false
  generator.view_specs false
  generator.routing_specs false
  generator.helper false
end
