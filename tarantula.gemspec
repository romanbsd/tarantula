# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tarantula}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Relevance, Inc."]
  s.date = %q{2009-06-06}
  s.description = %q{A big hairy fuzzy spider that crawls your site, wreaking havoc}
  s.email = %q{opensource@thinkrelevance.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "CHANGELOG",
     "MIT-LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION.yml",
     "examples/example_helper.rb",
     "examples/relevance/core_extensions/ellipsize_example.rb",
     "examples/relevance/core_extensions/file_example.rb",
     "examples/relevance/core_extensions/response_example.rb",
     "examples/relevance/core_extensions/test_case_example.rb",
     "examples/relevance/tarantula/attack_form_submission_example.rb",
     "examples/relevance/tarantula/attack_handler_example.rb",
     "examples/relevance/tarantula/crawler_example.rb",
     "examples/relevance/tarantula/form_example.rb",
     "examples/relevance/tarantula/form_submission_example.rb",
     "examples/relevance/tarantula/html_document_handler_example.rb",
     "examples/relevance/tarantula/html_report_helper_example.rb",
     "examples/relevance/tarantula/html_reporter_example.rb",
     "examples/relevance/tarantula/invalid_html_handler_example.rb",
     "examples/relevance/tarantula/io_reporter_example.rb",
     "examples/relevance/tarantula/link_example.rb",
     "examples/relevance/tarantula/log_grabber_example.rb",
     "examples/relevance/tarantula/rails_integration_proxy_example.rb",
     "examples/relevance/tarantula/result_example.rb",
     "examples/relevance/tarantula/tidy_handler_example.rb",
     "examples/relevance/tarantula/transform_example.rb",
     "examples/relevance/tarantula/w3c_validator_example.rb",
     "examples/relevance/tarantula_example.rb",
     "laf/images/header_bg.jpg",
     "laf/images/logo.png",
     "laf/images/tagline.png",
     "laf/javascripts/jquery-1.2.3.js",
     "laf/javascripts/jquery-ui-tabs.js",
     "laf/javascripts/jquery.tablesorter.js",
     "laf/javascripts/tarantula.js",
     "laf/stylesheets/tarantula.css",
     "lib/relevance/core_extensions/ellipsize.rb",
     "lib/relevance/core_extensions/file.rb",
     "lib/relevance/core_extensions/metaclass.rb",
     "lib/relevance/core_extensions/response.rb",
     "lib/relevance/core_extensions/string_chars_fix.rb",
     "lib/relevance/core_extensions/test_case.rb",
     "lib/relevance/tarantula.rb",
     "lib/relevance/tarantula/attack.rb",
     "lib/relevance/tarantula/attack_form_submission.rb",
     "lib/relevance/tarantula/attack_handler.rb",
     "lib/relevance/tarantula/crawler.rb",
     "lib/relevance/tarantula/detail.html.erb",
     "lib/relevance/tarantula/form.rb",
     "lib/relevance/tarantula/form_submission.rb",
     "lib/relevance/tarantula/html_document_handler.rb",
     "lib/relevance/tarantula/html_report_helper.rb",
     "lib/relevance/tarantula/html_reporter.rb",
     "lib/relevance/tarantula/index.html.erb",
     "lib/relevance/tarantula/invalid_html_handler.rb",
     "lib/relevance/tarantula/io_reporter.rb",
     "lib/relevance/tarantula/link.rb",
     "lib/relevance/tarantula/log_grabber.rb",
     "lib/relevance/tarantula/rails_integration_proxy.rb",
     "lib/relevance/tarantula/recording.rb",
     "lib/relevance/tarantula/response.rb",
     "lib/relevance/tarantula/result.rb",
     "lib/relevance/tarantula/test_report.html.erb",
     "lib/relevance/tarantula/tidy_handler.rb",
     "lib/relevance/tarantula/transform.rb",
     "lib/relevance/tarantula/w3c_validator.rb",
     "tasks/tarantula_tasks.rake",
     "template/tarantula_test.rb",
     "vendor/w3c_validators/CHANGELOG",
     "vendor/w3c_validators/LICENSE",
     "vendor/w3c_validators/README",
     "vendor/w3c_validators/README.svn",
     "vendor/w3c_validators/lib/w3c_validators.rb",
     "vendor/w3c_validators/lib/w3c_validators/constants.rb",
     "vendor/w3c_validators/lib/w3c_validators/css_validator.rb",
     "vendor/w3c_validators/lib/w3c_validators/exceptions.rb",
     "vendor/w3c_validators/lib/w3c_validators/feed_validator.rb",
     "vendor/w3c_validators/lib/w3c_validators/markup_validator.rb",
     "vendor/w3c_validators/lib/w3c_validators/message.rb",
     "vendor/w3c_validators/lib/w3c_validators/results.rb",
     "vendor/w3c_validators/lib/w3c_validators/validator.rb",
     "vendor/w3c_validators/rakefile.rb",
     "vendor/w3c_validators/test/fixtures/invalid_css.css",
     "vendor/w3c_validators/test/fixtures/invalid_encoding.html",
     "vendor/w3c_validators/test/fixtures/invalid_feed.xml",
     "vendor/w3c_validators/test/fixtures/invalid_html5.html",
     "vendor/w3c_validators/test/fixtures/invalid_markup.html",
     "vendor/w3c_validators/test/fixtures/valid_css.css",
     "vendor/w3c_validators/test/fixtures/valid_feed.xml",
     "vendor/w3c_validators/test/fixtures/valid_html5.html",
     "vendor/w3c_validators/test/fixtures/valid_markup.html",
     "vendor/w3c_validators/test/test_css_validator.rb",
     "vendor/w3c_validators/test/test_exceptions.rb",
     "vendor/w3c_validators/test/test_feed_validator.rb",
     "vendor/w3c_validators/test/test_helper.rb",
     "vendor/w3c_validators/test/test_html5_validator.rb",
     "vendor/w3c_validators/test/test_markup_validator.rb",
     "vendor/xss-shield/MIT-LICENSE",
     "vendor/xss-shield/README",
     "vendor/xss-shield/init.rb",
     "vendor/xss-shield/lib/xss_shield.rb",
     "vendor/xss-shield/lib/xss_shield/erb_hacks.rb",
     "vendor/xss-shield/lib/xss_shield/haml_hacks.rb",
     "vendor/xss-shield/lib/xss_shield/safe_string.rb",
     "vendor/xss-shield/lib/xss_shield/secure_helpers.rb",
     "vendor/xss-shield/test/test_actionview_integration.rb",
     "vendor/xss-shield/test/test_erb.rb",
     "vendor/xss-shield/test/test_haml.rb",
     "vendor/xss-shield/test/test_helpers.rb",
     "vendor/xss-shield/test/test_safe_string.rb"
  ]
  s.homepage = %q{http://github.com/relevance/tarantula}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{thinkrelevance}
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{A big hairy fuzzy spider that crawls your site, wreaking havoc}
  s.test_files = [
    "examples/relevance/core_extensions/ellipsize_example.rb",
     "examples/relevance/core_extensions/test_case_example.rb",
     "examples/relevance/core_extensions/file_example.rb",
     "examples/relevance/core_extensions/response_example.rb",
     "examples/relevance/tarantula_example.rb",
     "examples/relevance/tarantula/crawler_example.rb",
     "examples/relevance/tarantula/link_example.rb",
     "examples/relevance/tarantula/html_document_handler_example.rb",
     "examples/relevance/tarantula/w3c_validator_example.rb",
     "examples/relevance/tarantula/log_grabber_example.rb",
     "examples/relevance/tarantula/form_submission_example.rb",
     "examples/relevance/tarantula/attack_form_submission_example.rb",
     "examples/relevance/tarantula/attack_handler_example.rb",
     "examples/relevance/tarantula/rails_integration_proxy_example.rb",
     "examples/relevance/tarantula/io_reporter_example.rb",
     "examples/relevance/tarantula/form_example.rb",
     "examples/relevance/tarantula/html_reporter_example.rb",
     "examples/relevance/tarantula/html_report_helper_example.rb",
     "examples/relevance/tarantula/tidy_handler_example.rb",
     "examples/relevance/tarantula/transform_example.rb",
     "examples/relevance/tarantula/result_example.rb",
     "examples/relevance/tarantula/invalid_html_handler_example.rb",
     "examples/example_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<htmlentities>, [">= 0"])
      s.add_runtime_dependency(%q<hpricot>, [">= 0"])
    else
      s.add_dependency(%q<htmlentities>, [">= 0"])
      s.add_dependency(%q<hpricot>, [">= 0"])
    end
  else
    s.add_dependency(%q<htmlentities>, [">= 0"])
    s.add_dependency(%q<hpricot>, [">= 0"])
  end
end
