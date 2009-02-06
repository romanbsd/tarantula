module W3CValidators
  class CSSValidator < Validator
    CSS_VALIDATOR_URI      = 'http://jigsaw.w3.org/css-validator/validator'

    # Create a new instance of the CSSValidator.
    #
    # ==== Options
    # You can pass in your own validator's URI (i.e.
    # <tt>CSSValidator.new(:validator_uri => 'http://localhost/check')</tt>).
    def initialize(options = {})
      if options[:validator_uri]
        @validator_uri = URI.parse(options[:validator_uri])
        options.delete(options[:validator_uri])
      else
        @validator_uri = URI.parse(CSS_VALIDATOR_URI)
      end
      super(options)
    end

    # The CSS profile used for the validation.
    #
    # +charset+ can be a string or a symbl from the W3CValidators::CSS_PROFILES hash.
    #
    # ==== Example
    #   set_profile!('css1')
    #   set_profile!(:css1)
    def set_profile!(profile)
      if profile.kind_of?(Symbol)
        if CSS_PROFILES.has_key?(profile)
          profile = profile.to_s
        else
          return
        end
      end
      @options[:profile] = profile
    end

    # The warning level, no for no warnings, 0 for less warnings, 1or 2 for more warnings
    def set_warn_level!(level = 2)
      warn_levels = ['0','1','2','no']
      return unless warn_levels.include?(level.to_s.downcase)

      @options[:warning] = level
    end

    # The language used for the response.
    def set_language!(lang = 'en')
      @options[:lang] = lang
    end

    # Validate the CSS of an URI.
    #
    # Returns W3CValidators::Results.
    def validate_uri(uri)
      return validate({:uri => uri})
    end

    # Validate the CSS of a string.
    #
    # Returns W3CValidators::Results.
    def validate_text(text)
      return validate({:text => text})
    end

    # Validate the CSS of a local file.
    #
    # +file_path+ may be either the fully-expanded path to the file or
    # an IO object (like File).
    #
    # Returns W3CValidators::Results.
    def validate_file(file_path)
      if file_path.respond_to? :read
        src = file_path.read
      else
        src = read_local_file(file_path)
      end
      return validate_text(src)
    end


protected
    def validate(options) # :nodoc:
      options = get_request_options(options)
      response = send_request(options, :get)
      @results = parse_soap_response(response.body)
      @results
    end

    # Perform sanity checks on request params
    def get_request_options(options) # :nodoc:
      options = @options.merge(options)

      options[:output] = SOAP_OUTPUT_PARAM

      unless options[:uri] or options[:text]
        raise ArgumentError, "an uri or text is required."
      end

      # URI should be a string.  If it is a URI object, .to_s will
      # be seamless; if it is not an exception will be raised.
      if options[:uri] and not options[:uri].kind_of?(String)
        options[:uri] = options[:uri].to_s
      end

      options
    end


    def parse_soap_response(response) # :nodoc:
      doc = REXML::Document.new(response)

      result_params = {}

      {:uri => 'uri', :checked_by => 'checkedby', :validity => 'validity', :css_level => 'csslevel'}.each do |local_key, remote_key|
        if val = doc.elements["//*[local-name()='cssvalidationresponse']/*[local-name()='#{remote_key.to_s}']"]
          result_params[local_key] = val.text
        end
      end

      results = Results.new(result_params)

      ['warninglist', 'errorlist'].each do |list_type|
        doc.elements.each("//*[local-name()='#{list_type.to_s}']") do |message_list|

          if uri_node = message_list.elements["*[local-name()='uri']"]
            uri = uri_node.text
          end

          [:warning, :error].each do |msg_type|
            message_list.elements.each("*[local-name()='#{msg_type.to_s}']") do |message|
              message_params = {}
              message.each_element_with_text do |el|
                message_params[el.name.to_sym] = el.text
              end
              message_params[:uri] = uri
              results.add_message(msg_type, message_params)
            end
          end
        end
      end
      return results

    rescue Exception => e
      handle_exception e
    end


  end
end