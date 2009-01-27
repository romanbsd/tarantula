# Depends on the bundled version of w3c_validators
require File.join(File.dirname(__FILE__),'..','..','..','vendor','w3c_validators','lib','w3c_validators')

class Relevance::Tarantula::W3CValidator
  include Relevance::Tarantula

  # Possible options:
  # :validator_uri => 'http://localhost/w3c-validator/check'
  #   (if not specified, public w3c validator is used)
  # :show_warnings => true (default: false)
  def initialize(options = {})
    @show_warnings = options.delete(:show_warnings)
    @validator = W3CValidators::MarkupValidator.new(options)
  end

  def handle(result)
    response = result.response
    return unless response.html? and response.code.to_s == '200'

    results = @validator.validate_text(response.body)

    if !results.errors.empty? or (@show_warnings and !results.warnings.empty?)
      error_result = result.dup
      error_result.description = "Bad HTML (W3C Validator)"
      error_result.data = results.errors.collect {|e| "Line: #{e.line}, column: #{e.col}, error: #{e.message}"}.join("\n")
      error_result.data += "\n" + results.warnings.collect {|e| "Line: #{e.line}, column: #{e.col}, warning: #{e.message}"}.join("\n") if @show_warnings
      error_result
    end
  end
end
