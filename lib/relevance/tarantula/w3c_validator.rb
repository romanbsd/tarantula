# Depends on a bundled version of w3c_validators
require "#{File.dirname(__FILE__)}/../../../vendor/w3c_validators/lib/w3c_validators"

class Relevance::Tarantula::W3CValidator
  include Relevance::Tarantula

  # Possible options (passed through to MarkupValidator):
  # :validator_uri => 'http://localhost/w3c-validator/check'
  def initialize(options = {})
    @validator = W3CValidators::MarkupValidator.new(options)
  end

  def handle(result)
    response = result.response
    return unless response.html? and response.code == '200'

    results = @validator.validate_text(response.body)

    if results.errors.length > 0
      error_result = result.dup
      error_result.description = "Bad HTML (W3C Validator)"
      error_result.data = results.errors.collect {|e| "Line: #{e.line}, column: #{e.col}, error: #{e.message}"}.join("\n")
      error_result
    end
  end
end
