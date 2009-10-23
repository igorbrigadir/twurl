module Twurl
  class RequestController < AbstractCommandController
    def dispatch
      if client.needs_to_authorize?
        raise Exception, "You need to authorize first."
      end
      perform_request_from_options(options)
    end

    def perform_request_from_options(options)
      response = client.perform_request_from_options(options)
      CLI.puts response.body
    end
  end
end